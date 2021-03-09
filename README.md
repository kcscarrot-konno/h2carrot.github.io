# h2carrot.github.io
H2Carrot GitHub Pages

KCS Carrot Corp. H2 GitHub Pagesです。

[jekyll](http://jekyllrb-ja.github.io/) を使用しています。

### 環境構築

* git cloneして、bundle installする
```
$git clone git@github.com:YOURNAME/h2carrot.github.io
$cd h2carrot.github.io
$bundle install
```
* jekyllコマンドでサーバを起動する
  * --watch: ファイルを編集するとサーバを再起動しなくても編集が反映される
  * --port: ポート指定。デフォルト 4000
  * --host: vagrant, dockerで起動してアクセスする場合指定する
```
$bundle exec jekyll serve --watch [--port port] [--host 0.0.0.0]
```
* `http://localhost:4000` をブラウザで開く

### 構成

#### トップ画面

* index.markdownを表示
* レイアウトは、`_layouts/home.html` を使用
* `_layouts/home.html` 内で、`_includes/` 配下のテンプレートを使用

#### 各記事

* `_post/*.md` 配下の各記事を表示
* レイアウトは、`_layouts/post.html` を使用
* `_layouts/home.html` 内で、`_includes/` 配下のテンプレートを使用

### 記事を追加する

```
$rake post title="title" [date=YYYY-MM-DD]
```
* title : 記事のファイル名、URLになるため、半角英数字で入力する。未指定の場合 'new' で作成される
* date : 公開日付。指定しない場合、当日で作成される

_post/YYYY-MM-DD-title.md ファイルが作成されるので、ファイルを編集する。

### 記事のフォーマット

通常のmarkdownと同じ。

ファイル上部の設定項目については、以下を参照

* layout: postのままにしておくこと
* title: 作成時の名前、またはデフォルトのnewが指定されるので編集する
* published_at: 表示される日付(ファイル名はURLのみで使用される)
* author: 記載した人のアカウント。GitHub名でリンクされる
* permalink: 固定リンク
* categories: 現在は未使用。今後カテゴリー表示できるようにも検討しているので、正しく設定しておくことが望ましい
* tags: 現在は未使用。今後タグで表示できるようにも検討しているので、正しく設定しておくことが望ましい

### code block

#### 表記 その1
<pre style="background-color: #F6F8FA;">
```ruby
def hoge
  p 'Hello World'
end
```
</pre>

#### 表記 その2(行数表示あり)
<pre style="background-color: #F6F8FA;">
{% highlight ruby linenos %}
def hoge
  p 'Hello World'
end
{% endhighlight %}
</pre>

#### ハイライト

コードのハイライトは、rougeを使用。 現在は、thankful_eyes を使用。
```
rougify style thankful_eyes  > assets/css/syntax.css
```

[Preview Page](https://spsarolkar.github.io/rouge-theme-preview/)
