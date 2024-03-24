# GCP Rails Free Starter

このプロジェクトは、Docker を使用してローカル開発環境を構築し、PostgreSQL をデータベースとして使用する Rails 7 アプリケーションのスターターテンプレートです。

## 前提条件

- Docker と Docker Compose がシステムにインストールされていること。

## セットアップ手順

### プロジェクトのクローン

GitHub からプロジェクトをクローンします:

```bash
git clone https://github.com/your-username/gcp-rails-free-starter.git
cd gcp-rails-free-starter
```

### 初期セットアップの実行

プロジェクトの初期セットアップを行います。これには、Docker イメージのビルド、新規 Rails プロジェクトの作成、データベースのセットアップが含まれます:

```
make init-project
```

### アプリケーションの起動

```
docker-compose up
```

アプリケーションが起動したら、ブラウザで http://localhost:3000 にアクセスして、Rails のウェルカムページが表示されることを確認します。

### Makefile コマンド

プロジェクトにはいくつかの便利な Makefile コマンドが含まれています:

- make init-project: プロジェクトの初期セットアップを実行します。
- make up: Docker コンテナをバックグラウンドで起動します。
- make down: 起動中の Docker コンテナを停止し、削除します。
- make create-db: 新しいデータベースを作成します。
- make migrate-db: データベースマイグレーションを実行します。
- make reset-db: データベースをリセットし、再度マイグレーションを実行します。
- make seed-db: データベースにシードデータを投入します。
- make test: テストを実行します。
- make console: Rails コンソールを開始します。
- make logs: Docker コンテナのログを表示します。
