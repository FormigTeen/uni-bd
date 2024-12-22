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


def get_headers(times = 1):
    return ["Contexto", "Arquivo", "Média"] + ["Exec #" + str(index + 1) for index in range(times)]

def prepare_sheet(times = 1):
    paths = get_sql_files()
    table = [get_headers(times)]
    for file_path in paths:
        query = read(file_path)
        file_name = basename(file_path)
        folder_name = os.path.basename(os.path.dirname(file_path))
        print("Gerando resultados para " + file_name)
        results = [get_execution(tune(query)) for _ in range(times)]
        table.append([
            folder_name.capitalize(), file_name, mean(results), *results,
        ])
        print("Resultados gerado!")
    return table

def generate_sheet(times = 1):
    file_path = os.path.join(get_output_folder(), "result.ods")
    lines = prepare_sheet(times)
    header, *lines = lines
    df = pd.DataFrame(lines, columns=header)
    df.to_excel(file_path, engine="odf", index=False, header=True)
    return True