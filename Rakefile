require 'jekyll'

# Usage: rake post title="title" [date="20200316"]
desc "新しい記事を追加する ex) rake post title=\"title\" [date=\"2020-03-16\"]"
task :post do
  title = (ENV["title"] || "new").downcase.gsub(" ", "_")
  begin
    published_at = ENV['date'] || Time.now.strftime("%Y-%m-%d")
    Time.parse(published_at)
  rescue
    abort "aborted: date format error. (#{ENV['date']})"
  end

  config = Jekyll.configuration
  page_name = "#{published_at}-#{title}"
  fname =  File.join("_posts", "#{page_name}#{config['command']['post']['file_ext']}")

  fpath = File.join(config['source'], fname)
  if File.exist?(fpath)
    abort "aborted: file already exist.(#{fpath})"
  end

  File.open(fpath, "w")  do |fd|
    fd.puts <<-EOS
---
layout: post
title: #{title}
published_at: #{published_at}
author: YOURNAME
permalink: /#{published_at[0,4]}/#{published_at[5,2]}/#{published_at[8,2]}-#{title}
categories: [tech, travel, cooking]
tags: [Ruby, AWS, Azure, Keyboard]
---
    EOS
  end

  STDOUT.puts "create template file. please edit '#{fname}'"
end

# Usage: rake advcal title="title" day=1
desc "新しいアドベントカレンダー記事を追加する ex) rake advcal title=\"title\" day=1"
task :advcal do
  # TODO アドベントカレンダーのURL
  calendar_url = "http://carrot.co.jp/TBD"

  day = ENV['day'].to_i

  unless day.between?(1, 25)
    abort "aborted: day of advent calendar must be between 1 to 25."
  end

  published_at = Time.now.strftime("%Y-12-#{day.to_s.rjust(2, "0")}")
  Time.parse(published_at)

  title = (ENV["title"] || "new").downcase.gsub(" ", "_")

  config = Jekyll.configuration
  page_name = "#{published_at}-#{title}"
  fname =  File.join("_posts", "#{page_name}#{config['command']['post']['file_ext']}")

  fpath = File.join(config['source'], fname)
  if File.exist?(fpath)
    abort "aborted: file already exist.(#{fpath})"
  end

  File.open(fpath, "w")  do |fd|
    fd.puts <<~EOS
      ---
      layout: post
      title: #{title}
      published_at: #{published_at}
      author: YOURNAME
      permalink: /#{published_at[0,4]}/#{published_at[5,2]}/#{published_at[8,2]}-#{title}
      categories: [tech, travel, cooking]
      tags: [アドベントカレンダー]
      image: /assets/images/advent_calendar_2025.jpg
      ---

      こんにちは、[YOURGROUP]の[YOURNAME]です。

      この記事は、[ケーシーエスキャロット Advent Calendar #{Time.now.strftime("%Y")}](#{calendar_url})の#{day}日目の記事です。

      [ここに記事本文を書く]

      :christmas_tree: :santa: :christmas_tree: :santa: :christmas_tree:

      ケーシーエスキャロット Advent Calendar #{Time.now.strftime("%Y")} の他の記事は[アドベントカレンダーのページ](#{calendar_url})からアクセスすることができます。

      他の記事もぜひ楽しんでください！
    EOS
  end

  STDOUT.puts "create template file. please edit '#{fname}'"
end
