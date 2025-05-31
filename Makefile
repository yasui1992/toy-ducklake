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


.PHONY: run-create-table
run-create-table:
	@docker run \
	--rm \
	-v $(PWD)/tmp/ducklake:/tmp/ducklake \
	-v $(PWD)/sql/create_table.sql:/tmp/create_table.sql \
	-it \
	duckdb-cli \
	duckdb -c ".read /tmp/create_table.sql"
