class FizzbuzzGame
  def initialize
    @test_case_variables = []
  end

  def play
    prompt_user
    parse_user_input
  end

  def prompt_user
    print "Please enter three different numbers, separated by a space (e.g. '3 5 100'). Type 'END' when you finish. "
    $/ = "END"
    @user_input = STDIN.gets.chomp
  end

  def parse_user_input
    test_cases = @user_input.split("\n")
    test_cases.each do |test_case|
      @test_case_variables << test_case.split(" ").map { |s| s.to_i }
    end
    if test_cases.count <= 20
      check_constraints
    else
      puts "Sorry you may only do 20 cases at a time"
    end
  end

  def check_constraints
    @test_case_variables.each do |variable|
      if (1..20).include?(variable[0] && variable[1]) && (21..100).include?(variable[2])
        (1..variable[2]).each do |n|
          if n % variable[1] == 0 && n % variable[0] == 0
            print "FB "
          elsif n % variable[0] == 0
            print "F "
          elsif n % variable[1] == 0
            print "B "
          else
            print n.to_s + " "
          end
        end
        print "\n"
      else
        puts "Sorry, the first two numbers must be between 1 and 20 and the last number should be between 21 and 100"
      end
    end
  end
end

fizzbuzz_game = FizzbuzzGame.new
fizzbuzz_game.play
