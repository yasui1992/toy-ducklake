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
	-it \
	duckdb-cli
