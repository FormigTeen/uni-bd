import os
import pandas as pd
from os.path import basename
from statistics import mean

from helpers.database import get_execution, tune
from helpers.files import read, get_sql_files

def get_output_folder():
    path = os.path.join("..", "outputs")
    os.makedirs(path, exist_ok=True)
    return path


def prepare_sheet(level, times = 1):
    paths = get_sql_files(level)
    headers = ["Arquivo", "Média"] + ["Exec #" + str(index + 1) for index in range(times)]
    table = [headers]
    for file_path in paths:
        query = read(file_path)
        file_name = basename(file_path)
        results = [get_execution(tune(query)) for _ in range(times)]
        table.append([
            file_name, mean(results), *results,
        ])
    return table

def generate_sheet(level, times = 1):
    file_path = os.path.join(get_output_folder(), str(level) + ".ods")
    lines = prepare_sheet(level, times)
    header, *lines = lines
    df = pd.DataFrame(lines, columns=header)
    df.to_excel(file_path, engine="odf", index=False, header=True)
    return True