class FizzbuzzGame
  def play
    prompt_user
    assign_variables
    print_numbers
  end

  def prompt_user
    print "Please enter three different numbers, separated by a space (e.g. '3 5 100') "
    @user_input = gets.chomp
  end

  def assign_variables
    variables = @user_input.split(" ").map { |s| s.to_i }
    @first_divisor = variables[0]
    @second_divisor = variables[1]
    @last_value_in_range = variables[2]
  end

  def print_numbers
    (1..@last_value_in_range).each do |n|
      if n % @first_divisor == 0 && n % @second_divisor == 0
        puts "FB"
      elsif n % @first_divisor == 0
        puts "F"
      elsif n % @second_divisor == 0
        puts "B"
      else
        puts n
      end
    end
  end
end

fizzbuzz_game = FizzbuzzGame.new
fizzbuzz_game.play
