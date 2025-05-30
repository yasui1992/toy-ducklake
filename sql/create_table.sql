CREATE TABLE lake.penguins AS SELECT * FROM read_csv("http://blobs.duckdb.org/data/penguins.csv");
