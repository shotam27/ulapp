FROM ruby:2.5.7
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /ulapp
# コンテナ内にulappディレクトリを作成

WORKDIR /ulapp
# 作成したulappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /ulapp/Gemfile
COPY Gemfile.lock /ulapp/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のulapp配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /ulapp
# ローカルのulapp配下のファイルをコンテナ内のulapp配下にコピー