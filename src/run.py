import psycopg2 
from psycopg2 import OperationalError
from psycopg2.extras import execute_values
import logging 
import os 
from pathlib import Path
import pandas as pd
from typing import List


# create logger and set level to INFO
logger = logging.getLogger(__name__) # creating logs specific to this file
logger.setLevel("INFO")


def create_postgres_connection(
        user: str,
        password: str,
        port: int,
        host: str,
        dbname = None
    ) -> psycopg2.connect:
    
    """ Connecting to a postgresql database and returns a tuple (cursor, connection) """ 
    
    logger.info("Initiating PostgreSQL connction..")
    try:
        connection = psycopg2.connect(
            dbname = dbname, 
            user = user,
            password = password,
            host = host,
            port = port 
        )
        logger.info("Connected successfully..")
        return connection 
    
    except OperationalError as op_error:
        logger.error("Failed to connect to database due to error:")
        logger.exception(op_error)
    
    # if errors return blank tuple
    return None
    # SystemExit("Failed to connecto to PostgreSQL database") # Maybe we'd want to completely kill the program here?


def process_file(file_path: Path, db_connection: psycopg2.connect, table_name: str) -> None: 
    """ Loads data from file into database  """
    bet_df = pd.read_csv(file_path)
    if bet_df.empty:
        logger.error(f"File {file_path} is empty")
        return 
    
    logger.info(f"Processing file: {file_path} with {len(bet_df)} rows")

    # converting dataframe into tuples to build of the insert deduplication queries
    data_tuples = list(bet_df.itertuples(index=False, name=None))
    columns = list(bet_df.columns)
    columns_str = ', '.join(columns)

    insert_query = f"""
        insert into {table_name} ({columns_str})
        values %s 
        on conflict do nothing
        ;
    """
    try:    
        with db_connection.cursor() as cursor:
            # this should reduce risk of code injection
            execute_values(
                cur = cursor, 
                sql = insert_query,
                argslist = data_tuples
            )
            db_connection.commit()
            logger.info(f"Successfully loaded file: {file_path}")
    except Exception as e:
        db_connection.rollback() # any issue stop and revert back to last valid state
        logging.error(f"Error processing file: {file_path}")
        logging.exception(e)


def get_files_from_directory(directory: str) -> List[str]:
    
    """
        Checks for csv files for bets in the specified landed_files directory to be loaded into 
        a postgresql tables called Bets
    """
    landed_filed_dir = Path(directory)
    bet_files = list(landed_filed_dir.glob("bets*.csv"))
    if not bet_files:
        logger.error("No Bets csv files found. ")
        return 

    return bet_files


if __name__ == '__main__':
    logger.info("Initiated and now looking for files")

    bets_files = get_files_from_directory("landed_files")
    logger.info("Retrieved all files from directory")

    logger.info("Moving to create database connection")
    # Will need to make sure can update these depending if
    # using pytest and the dev database or not
    db_connection = create_postgres_connection(
        user =  os.getenv("POSTGRES_USER"),
        password =  os.getenv("POSTGRES_PASSWORD"),
        port = os.getenv("POSTGRES_PORT_NUMBER"),
        host = os.getenv("POSTGRES_HOSTNAME"),
        dbname = os.getenv("POSTGRES_DATABASE")
    )

    logger.info("Iterating through file(s)")
    for file_path in bets_files:
        process_file(
            file_path = file_path,
            db_connection = db_connection, 
            table_name = "bet"
        )

    logger.info("Data successfully loaded into database")