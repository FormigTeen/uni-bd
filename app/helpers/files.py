import os
import glob


def get_sql_files():
    base_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
    queries_path = os.path.join(base_path, "database", "queries")
    sql_files_path = os.path.join(queries_path, "**", "*.sql")
    sql_files = glob.glob(sql_files_path, recursive=True)
    return sql_files


def read(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            return content
    except FileNotFoundError:
        return f"Erro: O arquivo '{file_path}' não foi encontrado."
    except PermissionError:
        return f"Erro: Sem permissão para ler o arquivo '{file_path}'."
    except Exception as e:
        return f"Erro inesperado: {e}"
