# GCP Rails Free Starter

この文書は、`gcp-rails-free-starter`のセットアップと使用方法について説明します。この Rails アプリケーションは、Docker を使用してローカル開発環境を構築し、PostgreSQL をデータベースとして使用します。

## 前提条件

- Docker がインストールされていること
- Docker Compose がインストールされていること

## セットアップ手順

プロジェクトをセットアップするには、以下の手順に従ってください。

1. **リポジトリのクローン**

   ```bash
   git clone https://github.com/your-username/gcp-rails-free-starter.git
   cd gcp-rails-free-starter
   ```

2. **環境のビルド**

   Makefile を使用して環境をビルドします。

   ```bash
   make setup
   ```

   これにより、Docker イメージがビルドされ、必要な Gem がインストールされ、データベースが作成され、マイグレーションが実行されます。

3. **アプリケーションの起動**

   アプリケーションを起動するには、以下のコマンドを実行します。

   ```bash
   make up
   ```

   これにより、アプリケーションがポート 3000 で起動します。

4. **アクセス**

   ブラウザを開いて `http://localhost:3000` にアクセスします。Rails のウェルカムページが表示されれば、セットアップは成功です。

## データベースのセットアップ

データベースを初期化し、シードデータを投入するには、以下のコマンドを実行します。

    ```bash
    make db-setup
    ```

## その他のコマンド

- **コンテナの停止と削除**

  ```bash
  make **down**
  ```

- **データベース設定の更新**

  必要に応じてデータベースの設定を更新するには、以下のコマンドを実行します。

  ```bash
  make update-db-config
  ```

## ライセンス

このプロジェクトは[MIT ライセンス](LICENSE)の下で公開されています。
