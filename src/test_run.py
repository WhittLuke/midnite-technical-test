import os
import pytest
import pandas as pd
from pathlib import Path
import psycopg2
from psycopg2 import OperationalError
from run import create_postgres_connection, process_file, get_files_from_directory

# Simulate a cursor and connection
class FakeCursor():
    def __init__(self):
        self.executed_query = None
        self.executed_args = None 

    def __enter__(self):
        return self 
    
    def __exit__(self):
        return self 
    

class FakeConnection:
    def __init__(self):
        self.commit_called = False 
        self.rollback_called = False
        self.fake_cursor = FakeCursor()


        def cursor(self):
            return self.fake_cursor


        def commit(self):
            self.commit_called = True


        def rollback(self):
            self.rollback_called = True


# Tests
def test_create_postgres_connection(monkeypatch):
    """ Testing create_postgres_connection returns a connection object when postgres connects """
    class FakeConnectionSuccess:
        pass 

    def fake_connect(*args, **kwargs):
        return FakeConnectionSuccess()
    
    monkeypatch.setattr(psycopg2, "connect", fake_connect())

    connection = create_postgres_connection(
        user = "user",
        password = "password",
        port = 5432,
        host = "localhost",
        dbname = "testdb"
    )

    assert connection is not None


# Add more if have time