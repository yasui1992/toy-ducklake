# toy-ducklake

DuckLakeで遊ぶ

## DuckLakeとは？

DuckLakeは、MotherDuckが開発したオープンソースのLakehouseフォーマットです。2025年5月に公開されました。  
従来のIcebergやDelta Lakeのようなファイルベースのメタデータ管理の複雑さを解消するため、DuckLakeではすべてのメタデータ管理をSQLデータベースで行います。

データはParquet形式で保存され、メタデータはDuckDBのデータベース内で管理されるため、シンプルで高速なデータ操作が可能です。これにより、ACIDトランザクション、タイムトラベル、スキーマの進化（列の追加・削除・データ型の変更）などの高度な機能を、標準的なSQLだけで利用できます。

DuckLakeはDuckDBの拡張機能として提供されており、DuckDB v1.3.0以降で利用可能です。

## 使い方

```sh
# Dockerイメージのビルド
make build

# TPC-H SF1のデータセットをレイクにロードする
make run-create-table

# Dockerコンテナの起動 (DuckDB CLI)
make run

# Dockerコンテナの起動 (DuckDB Local UI)
make run-local-ui
```

## 所感

- LakeHouseと呼ぶに相応しい、DataLakeとDataBaseの中間のような仕組みで面白い
  - 実データをparquetにしてDuckDBの強みを生かしつつ、容量の少ないメタデータをDBに移行するのは納得感がある
- NAS上に作る簡易DataLakeとして使えそう
- S3上に構築したときの「S3 Tables with DuckDB」 vs 「S3 Bucket with Ducklake」のProp.とCons.を比べてみたい
