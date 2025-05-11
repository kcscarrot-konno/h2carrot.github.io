# h2carrot.github.io
H2Carrot GitHub Pages

KCS Carrot Corp. H2 GitHub Pagesです。

[jekyll](http://jekyllrb-ja.github.io/) を使用しています。

このリポジトリを各自のアカウントにforkして作業してください。

### 環境構築

#### ローカル環境で実行する

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

#### Dockerコンテナ上で実行する

* git clone する
```
$git clone git@github.com:YOURNAME/h2carrot.github.io
```

* Dockerイメージをbuildする
```
$cd h2carrot.github.io
$docker compose build
```

* コンテナを起動する
```
$docker compose up
```

* `http://localhost:4000` をブラウザで開く

※ コンテナへ入りたい場合  
docker-compose.yml ファイルが存在する場所で以下コマンドを実行  
```
docker compose exec app bash
```

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

### 座談会記事向けのスタイルについて

座談会記事など、会話ベースの記事に利用することを想定したスタイルを用意しています。

実際の記述と表示の例は[RubyKaigi 2024の座談会記事](_posts/2024-07-19-rubykaigi2024.md) を参考にしてください。

以下のように、2階層の箇条書きで記述していきます。

```
{:.talk-paragraph}
* **発言者A**{:.speaker}
    * こんにちは！
* **発言者B**{:.speaker}
    * こんにちは！
    * 今日は天気がいいですね。

{:.talk-paragraph}
* **発言者B**{:.speaker}
    * おはようございます。
```

* 箇条書き段落の冒頭(もしくは末尾)に `{:.talk-paragraph}` と記述することで会話の段落であることを宣言する
* 箇条書き1段目に `**<発言者名>**{:.speaker}` の書式で発言者の名前を記載する
* 箇条書き2段目に発言内容を記載する
    * 項目を分割することで、同じ発言者による別の文章として表現することができます
* 段落を分ける場合は空行の後に再び `{:.talk-paragraph}` を記述し、同様に箇条書きで内容を記載していく

#### 発言者の識別用スタイル

`**<発言者名>**{:.speaker .orange}` 等と記載することで発言者名に色を付けることができます。発言者の識別用に利用してください。

用意している色のクラスは以下のとおりです。
* `red`<span style="color: #DD1155;">■</span>
* `pink`<span style="color: #CB48B7;">■</span>
* `orange`<span style="color: #FF773D;">■</span>
* `yellow`<span style="color: #FABC3C;">■</span>
* `green`<span style="color: #58A838;">■</span>
* `light-blue`<span style="color: #00B9AE;">■</span>
* `blue`<span style="color: #1A73C7;">■</span>
* `purple`<span style="color: #7A306C;">■</span>
* `black`<span style="color: #494947;">■</span> (デフォルト)

#### インタビュー記事向けのスタイル

発言者名の代わりに `* **<発言者名>**{:.interviewer}` と記述すると、発言者と発言内容の部分にインタビュアー用のスタイルが適用されます。通常の発言者との違いは、文字色(発言者用スタイルのblackよりも暗めの黒)と発言内容も太字になる点です。

インタビュアーを特定しない場合は `* **――**{:.interviewer}` のように記述するとそれっぽい雰囲気が出るかと思います。

実際の記述と表示の例は[2024年度の新人インタビュー記事](_posts/2025-01-07-rookies_interview_2024.md) を参考にしてください。

#### TSVから会話パートのmarkdownを生成する

`tools/tsv2zadankai.rb` というツールを用意しています。

以下のように実行するとzadankai.tsvと同じディレクトリにzadankai.mdが生成されます。

生成された内容を記事ファイルにコピーして使用することができます。

```
tools/tsv2zadankai.rb zadankai.tsv # => zadankai.mdが生成される
```

TSVファイルの構成は[サンプルのTSVファイル](tools/tsv2zadankai_sample.tsv)を参考にしてください。

* `config` で始まる行は設定情報を記述する
    * `config\t<色クラス名>\t<設定する発言者名>` で発言者に設定する色のクラスを設定できます
        * 同じ行のセルに続けて記載することで複数人指定することもできます
* `<発言者名>\t<発言内容>` で発言内容を記述する
    * 発言者名を空にすると、直近の発言者が続けて発言した扱いとなります
