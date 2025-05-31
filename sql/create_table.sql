INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

CREATE TABLE lake.customer AS SELECT * FROM customer;
CREATE TABLE lake.lineitem AS SELECT * FROM lineitem;
CREATE TABLE lake.nation AS SELECT * FROM nation;
CREATE TABLE lake.orders AS SELECT * FROM orders;
CREATE TABLE lake.part AS SELECT * FROM part;
CREATE TABLE lake.partsupp AS SELECT * FROM partsupp;
CREATE TABLE lake.region AS SELECT * FROM region;
CREATE TABLE lake.supplier AS SELECT * FROM supplier;
