---
layout: post
title: RubyKaigi2023 セッションレポート@オンライン参加
published_at: 2023-05-17
author: kcscarrot-hataoka
permalink: /2023/05/17-rubykaigi2023-session-reports-at-online03
categories: [Report, Tech]
tags: [Ruby]
---

こんにちは、H2開発グループのhataokaです。  
今年もRubyKaigiが5/11(木)～13(土)に長野県松本市で開催されました。  
私はオンラインで参加したのですが、2つ程簡単にレポートさせていただきます。  

- [Matz Keynote](#matz-keynote)
- [Multiverse Ruby](#multiverse-ruby)

## <u>Matz Keynote</u>

1日目のまつもとさんによるKeynote。  
今年はRuby誕生30年。  
年代毎の出来事と共にそこから学んだ教訓についてのお話でした。  
その中でも印象に残ったものをいくつかピックアップさせていただきます。  

### 良い名前を選ぶ

1993/02/24に「Ruby」という名前が決まったとのことで、Rubyはこの日を誕生日としているそうです。(他の言語はリリース日を誕生日としていることが多いとのこと)  
他にも名前の候補はあったそうですが、「Ruby」という名前でなければここまで広がることはなかったと思うとおっしゃっていました。  

### 最初に決めた基本的原則を変えない

まつもとさんの手元に残っている1番古いsrcがver. 0.49とのことですが、この時点で驚くほど今のRubyに似ているそうです。  
最初に決めた基本的な部分は変えないことが大事という話をされていました。  

### 人と人とのつながりが大事

人とのつながり、コミュニケーションとコミュニティの話は色んな年代で出てきていました。  
例えば、Alpha Releaseをした時、それまでは1人で開発していたけれど自分以外の人たちの意見を聞くようになり、自分だけでは気付かないことを学んだという話をされていました。  
また、最初のPublic Releaseした時は、メーリングリストで最初に「リリースおめでとうございます」というメールが来たけれど、次のメールで「でも私の環境では動きません」というメールが来たなんて話をされて、直接こういう風に開発者とコミュニケーションを取れる環境があることの良さを話されていました。  
こういったコミュニティが育っていったきっかけとして、2000年にRubyの最初の本が出たことや、2001年にJAOOに招待され講演を行った時のエピソードなどの話をされて、人と人とのつながりは大事ということを話されていました。  


## <u>Multiverse Ruby</u>

2日目の @shioyama さんによる講演で、グローバル名前空間にまったく触れずにコードを共有するという話でした。

### Rubyでのコードの共有はportableではない

Rubyでコードを共有＝アーキテクチャの共有 となり、Rubyのアーキテクチャは「global」「finite」「permanent」という特徴があるため、portableではないという話を最初にされていました。  

### portableな名前空間

これを解決する方法として、匿名ModuleのしたにModuleを作るという方法についてのお話をされていました。  
Moduleは「Named」のものと「Anonymous」のものがありますが、実はもう1つあり、匿名Moduleの配下にModuleを作るという方法で、この方法だと隔離できるとのことでした。  
通常匿名Moduleではnameがnilになりますが、匿名ModuleのしたにModuleを作るとtemporary nameが割り振られるそうです。

```ruby
irb(main):001:0> mod = Module.new
=> #<Module:0x00007f023be578d0>
irb(main):002:0> mod.name
=> nil
```

```ruby
irb(main):001:0> mod = Module.new
=> #<Module:0x00007f2b065ca818>
irb(main):002:0> mod::Foo = Module.new
=> #<Module:0x00007f2b065ca818>::Foo
irb(main):003:0> mod::Foo.name
=> "#<Module:0x00007f2b065ca818>::Foo"
```
### im

このportableな名前空間を使えるgemを作成したという話に続きました。

[shioyama / im](https://github.com/shioyama/im)

Ruby3.2からKernel.#loadに2つ目の引数が追加されていて、この第2引数にModuleを渡すと、渡したModuleの下でファイルが読み込まれるようになったそうです。  

[#6210](https://bugs.ruby-lang.org/issues/6210)    
[Kernel.#load](https://docs.ruby-lang.org/ja/latest/method/Kernel/m/load.html)  

ただ、requireの連鎖があると親となるModuleを引き回せないため、autoloadを使えるようにしたとのこと。  
Zeitwerkでは匿名Moduleを使用できないため、imはZeitwerkをforkして作成されたそうです。  
(個人的に「Zeitwerkで匿名モジュールを読み込もうとすると怒られるので、まずはこれを削除します」この一言がかなり印象に残っています(笑))  
また、Zeitwerkではcpathメソッドで生成されるStringが重要なキーとして使われているため、匿名Moduleを親にすると変数にいた時点でnameが書き変わってしまいエラーになるという問題は、こちらもRuby3.2から入ったconst_addedによって解決されたとのことでした。  

[#17881](https://bugs.ruby-lang.org/issues/17881)  
[Module#const_added](https://docs.ruby-lang.org/ja/latest/method/Module/i/const_added.html)  

imを使うとModule自体がloaderになるとのことです。  
そのため、バージョン違いの同じgemを同時にロードして使えたりするそうです。  

## まとめ

今回は2つ程簡単なレポートとしてまとめさせていただきましたが、他にもReDos関連のセッションや2日目のKeynoteではYJITのお話など、相変わらずRubyKaigiは興味深いセッションが多いなぁと感じながら視聴しました。  
英語力不足で理解しきれなかったセッションもありましたが、後日各セッションの映像が公開されたらもう1度観たいと思えるようなセッションもあり、とてもためになる3日間でした。
