#CSV用ライブラリの読み込み
require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

#1or2で分岐
if memo_type == 1
  puts "新規メモの名前を入力"
  memo_name = gets.to_s
  puts "メモの内容を入力"
  puts "Ctrl+Dで保存"
  memo_input = readlines.map(&:chomp)
  CSV.open(memo_name + '.csv','w') do |csv|
    csv << memo_input
  end
elsif memo_type == 2
  puts "既存メモの名前を入力"
  memo_name = gets.to_s
  puts "メモに追加する内容を入力"
  puts "Ctrl+Dで保存"
  memo_input = readlines.map(&:chomp)
  CSV.open(memo_name + '.csv','a') do |csv|
    csv << memo_input
  end
else
#エラー表示
  puts "入力エラー"
end