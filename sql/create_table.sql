ATTACH 'ducklake:metadata.ducklake' AS lake (DATA_PATH '/tmp/ducklake/');
CREATE TABLE lake.penguins AS SELECT * FROM read_csv("http://blobs.duckdb.org/data/penguins.csv");
