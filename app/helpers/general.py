from rich.console import Console

from helpers.screens import clear_terminal


def show_info():
    console = Console()
    clear_terminal()
    console.print("\n[bold green]System Information:[/bold green]")
    os.system("uname -a" if os.name != "nt" else "systeminfo")
    console.print("\n[bold cyan]Enter your next command below:[/bold cyan]")
