# toy-ducklake

DuckLakeで遊ぶ

## 使い方

```sh
# Dockerイメージのビルド
make build

# ペンギンデータをダウンロードしてテーブル作成する
make run-create-table

# Dockerコンテナの起動
make run
```

## 所感

- LakeHouseと呼ぶに相応しい、DataLakeとDataBaseの中間のような仕組みで面白い
  - 実データをparquetにしてDuckDBの強みを生かしつつ、容量の少ないメタデータをDBに移行するのは納得感がある
- NAS上に作る簡易DataLakeとして使えそう
