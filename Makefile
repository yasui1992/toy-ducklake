.PHONY: build
build:
	@docker build \
	--platform linux/amd64 \
	--target runtime \
	-t duckdb-cli \
	.

.PHONY: run
run:
	@docker run \
	--rm \
	-v $(PWD)/tmp/ducklake:/tmp/ducklake \
	-it \
	duckdb-cli \

run-local-ui:
	@docker run \
	--rm \
	--network host \
	-v $(PWD)/tmp/ducklake:/tmp/ducklake \
	-it \
	duckdb-cli \
	duckdb -ui


.PHONY: run-load-tpch
run-load-tpch:
	@docker run \
	--rm \
	-v $(PWD)/tmp/ducklake:/tmp/ducklake \
	-v $(PWD)/sql/load_tpch.sql:/tmp/load_tpch.sql \
	-it \
	duckdb-cli \
	duckdb -c ".read /tmp/load_tpch.sql"
