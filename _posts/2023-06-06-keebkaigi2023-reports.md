---
layout: post
title: KeebKaigi 参加レポート
published_at: 2023-06-06
author: kcscarrot-ooki
permalink: /2023/06/06-keebkaigi2023-reports
categories: [Report, Tech]
tags: [Ruby, Keyboard]
img: /assets/images/keebkaigi2023/keebkaigi2023_tenji_space1.jpg
---

こんにちは。H2開発グループの大木です。  

今回は、弊社もスポンサー致しました、
[KeebKaigi2023](https://keebkaigi.org/2023/)の参加レポートです。  
![image](/assets/images/keebkaigi2023/keebkaigi2023_sponsors.jpg)

KeebKaigiはキーボード好きのためのミートアップです。  
2023/05/10 長野県松本市で、
[RubyKaigi2023](https://rubykaigi.org/2023) のスピンオフミートアップとして開催されました。  

私自身キーボードを組み立てた経験もあり、
今回 KeebKaigi に参加できることを楽しみにしていました。  
（写真は組み立てたキーボードです。今も愛用しています。）  
![image](/assets/images/keebkaigi2023/keebkaigi2023_my_key.jpg)


当日の発表の様子は[動画が公開](https://www.youtube.com/watch?v=Lk3-5ceJz4Y&t=1s)されているので、こちらもぜひ御覧ください。

# 受付
入ってすぐの受付では参加者向けにノベルティの配布を行っていました。  
各種ステッカーや、なんとキーボードの基盤まで置いてありました。  
さすが KeebKaigi …！  
左奥にあるのは、開催地松本のシンボル、松本城の形のキーキャップです！  
![image](/assets/images/keebkaigi2023/keebkaigi2023_reception.JPG)

# 展示スペース
会場には展示スペースが設けられ、有志によるキーボード展示が行われていました。  
写真は展示の様子です。  
たくさんのキーボードが並んでいる様は圧巻でした…！  
![image](/assets/images/keebkaigi2023/keebkaigi2023_tenji_space1.jpg)
![image](/assets/images/keebkaigi2023/keebkaigi2023_tenji_space2.jpg)
![image](/assets/images/keebkaigi2023/keebkaigi2023_tenji_space3.jpg)

翌日の RubyKaigi のノベルティとして配布するキーボードも展示されていました。  
発表者でもあり、KeebKaigi の運営もされている @swan_match さんの作とのことです。  
後ろに RubyKaigi のロゴもあります。

![image](/assets/images/keebkaigi2023/keebkaigi2023_rubykaigi_key1.jpg)
![image](/assets/images/keebkaigi2023/keebkaigi2023_rubykaigi_key2.jpg)


# スポンサーブース
スポンサーブースには、自作キーボードキットの販売等を行っている [遊舎工房さん](https://yushakobo.jp/)のスペースがありました。  

![image](/assets/images/keebkaigi2023/keebkaigi2023_yuusha.jpg)


# オープニング
@kakutani さんによるオープニングトークからスタートしました。  
KeebKaigi を開くきっかけの話や、
このミートアップでキーボードを通した交流が生まれることを期待している、  
というメッセージを伝えてくれました。

# Keeb Talk
## Me, Keyboard, and RubyKaigi
発表者の @swan_match さんは、自作キーボードの設計も手がけられており、  
今回 KeebKaigi を松本で開催するきっかけとなった方です。  

トークでは、今まで手がけてきたキーボードの紹介や、  
ご自身の Ruby との関わりについてのお話されていました。  

発表とは直接関係ありませんが、腰に光らせたキーボードをぶら下げていて、  
そちらもとても気になりました。  

## Building the Perfect Custom Keyboard
@takai さんによる、完璧なカスタムキーボードについてのお話。  
カスタムキーボードとは、というところから、
カスタムキーボードの現在と未来についてお話されていました。  

コロナによる要因で、カスタムキーボードは似たような物が多くなっていたこと、  
コロナの影響が薄くなりつつある今、カスタムキーボードもまた広がりをみせていくはず、という事でした。  
カスタムキーボードを始めるには、今が良いタイミングだそうです！


## HITCHHIKER'S GUIDE TO THE SELF MADE KEYBOARD COMMUNITY
@takkanm さんの発表は、自作キーボードに関するコミュニティや、Youtube チャンネルなどを紹介する、
興味を持ち始めた人のためのガイドとなる内容でした。  

これから自作キーボードを始める、もしくはもっと自作キーボードを深めたい人必見です。


## Crafting the Endgame Keyboard
自作キーボードの設計をしている @foostan さんの発表です。  
設計してきたキーボードのポリシーや、何に影響を受けてきたかをお話されました。

どういった思想でキーボードを設計したか、というのは中々詳しく聞く機会もないので、
大変興味深いお話でした。  


## Pointing Device On The Partner Half
[PRK Firmware](https://github.com/picoruby/prk_firmware) の開発者である @hasumikin さんの発表。  

PRK Firmware は、Rubyでキーマップを書ける自作キーボード用ファームウェアフレームワークです。  
これにより実質 Ruby なキーボードを作ることができるようになりました。  

発表では PRK Firmware の課題についての説明をされていて、  
これを聞いて良いアイディアが沸いたら教えて欲しい、ということをお話していました。  

果たして成果はあったのでしょうか？


## Initial-V, Final Stage!
@tenderlove さんの発表は、Initial-V の名の通り、  
vim を走り屋のごとく速く扱うことができるキーボードを作った、というお話です。  
一体どういうこと…？と思われると思います。ぜひ動画で確認してみてください。  

大変盛り上がったトークでした。


# "狭ピッチ"トーク（LT）
"狭ピッチ"トークは 11 名の方の発表がありました。  

募集当初はそんなに集まるのか…という不安があったそうですが、  
実際にはたくさんの応募があり、泣く泣く絞っての11名とのことです。  

初めてキーボードを作ってみた話から、キーボードが電子楽器になるといった、
想像を超えた話もたくさんあり圧倒されました。


# 交流タイム
セッションの合間に 2回ほど休憩を兼ねた交流タイムがありました。  
展示されているキーボードを見たり、意見を交換したりと、今正に交流が起こっていると感じました。

また、交流タイムには松本にちなんだおやつも用意されていました。  
おやき美味しかったです。

![image](/assets/images/keebkaigi2023/keebkaigi2023_sweets1.jpg)
![image](/assets/images/keebkaigi2023/keebkaigi2023_sweets2.jpg)
![image](/assets/images/keebkaigi2023/keebkaigi2023_sweets3.jpg)

# まとめ
KeebKaigi を終えて、自分の中の今までのキーボードの概念が崩れました。  
キーボードとはこんなに自由な物なのか、と感じたのを特に強く覚えています。  
皆さん本当に様々な切り口からキーボードに向き合っているのだなと感じました。    

また会の中で度々交流というキーワードが出てきました。  
トークの中でも、「交流が増えることで、カスタムキーボードの世界も広がっていく」といったことをお話されていましたが、  
今正にこうやってキーボードの世界が広がっているんだな、と感じました。

最後に、今回このような素晴らしいミートアップのスポンサーをすることができ、大変光栄に思います。  
発表者の皆さん、運営の皆さんありがとうございました。
