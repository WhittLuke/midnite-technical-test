import os

# This will overrided the port when connecting to the Postgre
# docker container for development, when using Pytest
os.environ["PORT"] = "5433"