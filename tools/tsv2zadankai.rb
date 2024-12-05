#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'

path = ARGV[0]

module Tsv2Zadankai
  def main
    tsv_path = ARGV[0]
    return unless run? tsv_path

    config, content_rows = load_tsv(tsv_path)

    write_md(config, content_rows, tsv_path)
  end

  def run?(tsv_path)
    if tsv_path.nil? || tsv_path.empty?
      puts "File path required"
      return false
    end

    unless File.file? tsv_path
      puts "Invalid file input #{tsv_path}"
      return false
    end

    true
  end

  def load_tsv(tsv_path)
    config_rows = []
    content_rows = []

    CSV.foreach(tsv_path, col_sep: "\t") do |row|
      if row[0] == 'config'
        config_rows << row
      else
        content_rows << row
      end
    end

    # 本文パートの最初の行が空行の場合、文字列が入った行に到達するまでその行を捨てる
    content_rows.shift while content_rows[0].compact == []

    config = build_config(config_rows)

    [config, content_rows]
  end

  # 色名指定行の解析を行う
  def build_config(config_rows)
    config = {}
    config_rows.each do |row|
      row.shift # 先頭カラムはもう役目を終えているので捨てる
      row.compact!

      # compact!した結果、色名しか残らない場合は割り当てがないので無視する
      if row.size == 1
        next
      end

      color = row.shift
      row.each do |name|
        config[name] = color
      end
    end

    config
  end

  # 読み込んだ情報からMakrdownファイルを書き出す
  def write_md(config, content_rows, tsv_path)
    start_of_paragraph = true
    md_rows = []
    previous_speaker = '[未設定]'
    content_rows.each do |row|
      if row.compact == []
        # 段落の終了を検知
        md_rows << ''
        start_of_paragraph = true
        previous_speaker = '[未設定]'

        next
      end

      if start_of_paragraph
        md_rows << '{:.talk-paragraph}'
        start_of_paragraph = false
      end

      if row[0] && previous_speaker != row[0]
        # 発言者の切り替わりを検知
        style = config.include?(row[0]) ? ".#{config[row[0]]}" : ''
        md_rows << "* **#{row[0]}**{:.speaker #{style}}"
        previous_speaker = row[0]
      end

      md_rows << "    * #{row[1]}"
    end

    md_path = File.join(File.dirname(tsv_path), "#{File.basename(tsv_path, ".*")}.md")
    puts "Write md file to #{md_path}"

    File.open(md_path, 'w') do |file|
      file.write(md_rows.join "\n")
    end
  end

  module_function :main
  module_function :run?
  module_function :load_tsv
  module_function :build_config
  module_function :write_md
end

if __FILE__ == $PROGRAM_NAME
  Tsv2Zadankai.main
end
