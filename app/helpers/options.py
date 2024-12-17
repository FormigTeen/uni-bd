from collections import namedtuple
from typing import List

from rich.console import Console
from rich.prompt import Prompt
from rich.table import Table

from helpers.screens import clear_terminal

Option = namedtuple('Option', ['key', 'description', 'action'])

def display(options: List[Option]):
    clear_terminal()
    console = Console()
    table = Table(title="Interactive CLI Menu")

    table.add_column("Opção", justify="center", style="cyan", no_wrap=True)
    table.add_column("Descrição", justify="left", style="magenta")

    for option in options:
        key, description, _ = option
        table.add_row(str(key), str(description))
    console.print(table)

def handle(options: List[Option], input: str):
    console = Console()
    for option in options:
        key, description, func = option
        if key == input:
            func()
            return True
    console.print("\n[bold yellow]Invalid option. Please try again.[/bold yellow]")
    return False

def get_input() -> str:
    input_key = Prompt.ask("\nSelecione uma opção")
    return str(input_key)
