import os
from sqlalchemy import create_engine
import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

def get_engine():
    """
    Returns a reusable SQLAlchemy engine for PostgreSQL.
    Credentials are read from .env file.
    """
    user = os.getenv("PG_USER")
    host = os.getenv("PG_HOST")
    password = os.getenv("PG_PASSWORD")
    port = os.getenv("PG_PORT", 5433)
    db = os.getenv("PG_DB")

    url = f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{db}"

    engine = create_engine(url)
    return engine

def run_query(sql: str) -> pd.DataFrame:
    """
    Executes a SQL query and returns a Pandas DataFrame
    """
    engine = get_engine()
    df = pd.read_sql(sql, engine)
    return df