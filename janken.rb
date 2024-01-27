#ジャンケン
def janken
    draw = false
    puts "じゃんけん..."
    loop do
        puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
        input = gets.chomp

        unless input.match?(/\A[0-3]\z/) # 入力が0から3の数字で構成されているかをチェック
            puts "0から3の数字を選んでください"
            next # ループを再度実行
        end

        player_hand = input.to_i # 文字列を整数に変換
        if player_hand == 3
            exit
        end

        computer_hand = rand(3)        
        if draw == false
            puts "ホイ！"
        else
            puts "ショ！"
        end
        puts "-------------------------"
        hands = ["グー", "チョキ", "パー"]
        puts "あなた: #{hands[player_hand]}を出しました"
        puts "コンピューター: #{hands[computer_hand]}を出しました"
        puts "-------------------------"
    
        result = (player_hand - computer_hand + 3) % 3
    
        case result
            when 0
                draw = true
                puts "あいこで..."
            when 1
                draw = false
                return :lose
            when 2
                draw = false
                return :win
        end
    end
end

#あっち向いてホイ
def acchi_muite(janken_result)
    puts "あっち向いて〜"
    input = nil
    loop do
        puts "0(上)1(右)2(下)3(左)"
        input = gets.chomp

        unless input.match?(/\A[0-3]\z/) # 入力が0から3の数字で構成されているかをチェック
            puts "0から3の数字を選んでください"
            next # ループを再度実行
        end

        break
    end

    player_direction = input.to_i
    computer_direction = rand(4)

    directions = ["上", "右", "下", "左"]
    puts "ホイ！"
    puts "-------------------------"
    puts "あなた: #{directions[player_direction]}を出しました"
    puts "コンピューター: #{directions[computer_direction]}を出しました"
    puts "-------------------------"
    
    if janken_result == :win
        if player_direction == computer_direction
            puts "あなたの勝ちです"
            exit
        end
    elsif janken_result == :lose
        if player_direction == computer_direction
            puts "あなたの負けです"
            exit
        end
    end
end

#実行
loop do
    janken_result = janken
    puts "ジャンケン勝敗:#{janken_result}"
    acchi_muite(janken_result)
    puts "勝敗決まらずジャンケン再開"
end