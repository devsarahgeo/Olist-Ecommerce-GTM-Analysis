from pathlib import Path
from utils import run_query
import os

PROJECT_ROOT = Path(os.environ["PROJECT_ROOT"])
SQL_FOLDER = PROJECT_ROOT / "etl/extract/queries"

def extract_all():
    data = {}
    for sql_file in SQL_FOLDER.glob("*.sql"):
        name = sql_file.stem  
        sql = sql_file.read_text()
        data[name] = run_query(sql)
    return data
