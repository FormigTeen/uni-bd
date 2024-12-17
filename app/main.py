from typing import List

from rich.console import Console
from helpers.database import get_tables, tune, get_execution
from helpers.files import get_sql_files, read
from helpers.general import show_info
from helpers.options import Option, display, handle, get_input
from helpers.outputs import prepare_sheet, generate_sheet
from helpers.screens import clear_terminal


def test_connection():
    try:
        get_tables()
        print("Banco de Dados Inicializado!");
    except Exception as error:
        print("Verifique as Configurações do Banco")

def test():
    table = generate_sheet("basics", 50)
    print(table)

def get_main_options() -> List[Option]:
    return [
        Option("1", "Exibir Menu", lambda: display(get_main_options())),
        Option("2", "Apresentar Informações do Sistema", show_info),
        Option("3", "Executar Teste de Conexão com o Banco", test_connection),
        Option("4", "Executar Script de Debug", test),
        Option("5", "Sair do Programa", lambda: exit(0))
    ]

def main():
    clear_terminal()
    display(get_main_options())
    while True:
        console = Console()
        handle(get_main_options(), get_input())

if __name__ == "__main__":
    main()

