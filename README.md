# h2carrot.github.io
H2Carrot GitHub Pages

KCS Carrot Corp. H2 GitHub Pagesです。

### 環境構築

```
$git clone git@github.com:YOURNAME/h2carrot.github.io
$cd h2carrot.github.io
$bundle install
```

```
bundle exec jekyll serve --watch [--port $PORT] [--host 0.0.0.0]
```

### 記事を追加する

```
rake post title="title" [date=YYYY-MM-DD]
```
* title : 記事のファイル名、URLになるため、半角英数字で入力する。未指定の場合 'new' で作成される
* date : 作成日付。指定しない場合、当日で作成される

_post/YYYY-MM-DD-title.md ファイルが作成されるので、ファイルを編集する。
