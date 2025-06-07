INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

CREATE OR REPLACE TABLE lake.customer AS SELECT * FROM customer;
CREATE OR REPLACE TABLE lake.lineitem AS SELECT * FROM lineitem;
CREATE OR REPLACE TABLE lake.nation AS SELECT * FROM nation;
CREATE OR REPLACE TABLE lake.orders AS SELECT * FROM orders;
CREATE OR REPLACE TABLE lake.part AS SELECT * FROM part;
CREATE OR REPLACE TABLE lake.partsupp AS SELECT * FROM partsupp;
CREATE OR REPLACE TABLE lake.region AS SELECT * FROM region;
CREATE OR REPLACE TABLE lake.supplier AS SELECT * FROM supplier;
