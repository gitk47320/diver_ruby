def execute
  while true
    num = input_operation_num
    
    case num
    when 1
      input_evaluation
    when 2
      show_registered_evaluations
    when 3
      puts "終了します"
      break
    else
      puts "1から3で入力してください"
    end
  end
end

def input_operation_num
  puts "実施したい処理を選択してください"
  puts "1:評価ポイントとコメントを入力する"
  puts "2:今までの結果を確認する"
  puts "3:やめる"
  gets.to_i
end

def input_evaluation
  point = input_point
  while true
    if point <= 0 || point > 5
      point = input_point
    else
      comment = input_comment
      save_evaluation(point, comment)
      break
    end
  end
end

def input_point
  puts "1から5で評価を入力してください"
  gets.to_i
end

def input_comment
  puts "コメントを入力してください"
  gets
end

def save_evaluation(point, comment)
  post = "ポイント：#{point}　コメント：#{comment}"
  File.open("data.txt", "a") do |file|
    file.puts(post)
  end
end

def show_registered_evaluations
  puts "これまでの結果"
  File.open("data.txt", "r") do |file|
    file.each_line do |line|
      puts line
    end
  end
end

execute
