require 'jekyll'

# Usage: rake post title="title" [date="20200316"]
desc "新しい記事を追加する ex) rake post title=\"title\" [date=\"2020-03-16\"]"
task :post do
  title = (ENV["title"] || "new").downcase.gsub(" ", "_")
  begin
    written_date = ENV['date'] || Time.now.strftime("%Y-%m-%d")
    Time.parse(written_date)
  rescue
    abort "aborted: date format error. (#{ENV['date']})"
  end

  config = Jekyll.configuration
  page_name = "#{written_date}-#{title}"
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
date: #{written_date}
written_by: YOURNAME
categories: [tech, travel, cooking]
tags: [Ruby, AWS, Azure, Keyboard]
---
    EOS
  end

  STDOUT.puts "create template file. please edit '#{fname}'"
end
