FROM ruby:2.5.7

# リポジトリを更新し依存モジュールをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

# ルート直下にulappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /ulapp
WORKDIR /ulapp

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /ulapp/Gemfile
ADD Gemfile.lock /ulapp/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /ulapp

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets