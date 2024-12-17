import re

import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

from helpers.list import get_first

config = {
    "host": "localhost",
    "port": 5432,
    "user": "postgres",
    "password": "mysecretpassword",
    "dbname": "postgres",
}

connection = None
def get_connection():
    global connection
    if connection is not None:
        return connection
    try:
        connection = psycopg2.connect(
            dbname=config["dbname"],
            user=config["user"],
            password=config["password"],
            host=config["host"],
            port=config["port"],
        )
        connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        return connection
    except Exception as e:
        connection = None
        raise Exception("Erro ao conectar ao banco de dados!")


def analyse(query):
    cursor = get_connection().cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    cursor.close()
    return results

def get_tables():
    query = """
        SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'public'
    """
    return execute(query)

def tune(query):
    cursor = get_connection().cursor()
    explain_query = f"EXPLAIN ANALYZE {query}"
    cursor.execute(explain_query)
    results = cursor.fetchall()
    cursor.close()
    return [get_first(result) for result in results if get_first(result) is not None]

def get_execution(results):
    for result in results:
        if "execution time" in result.lower():
            return float(re.search(r"[-+]?\d*\.\d+|\d+", result).group())
    return 0.0