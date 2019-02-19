require './questions.rb'
require './players.rb'

class Game

  def initialize
    puts '...I want to play a game...'
    @player1 = Players.new("player 1")
    @player2 = Players.new("player 2")
    sleep(1)
    puts '...Well alright then, let\'s get started!'
  end

  def question
    question = Question.new
    @query = question.question
    @answer = question.answer
    sleep(1)
    puts ' *** NEXT QUESTION *** '
    if @player1.turn
      puts "  --- #{@player1.name} ---"
      puts "#{@query}"
    else
      puts "  --- #{@player2.name} ---"
      puts "#{@query}"
    end
  end

  def check_answer
    if STDIN.gets.chomp.to_i == @answer
      if @player1.turn
        sleep(1)
        puts 'You are correct!'
        sleep(1)
        @player1.turn = false
        @player2.turn = true
        life
        win?
      else
        sleep(1)
        puts 'You are correct!'
        sleep(1)
        @player1.turn = true
        @player2.turn = false
        life
        win?
      end
    else
      if @player1.turn
        @player1.life -= 1
        sleep(1)
        puts "#{@player1.name}: WRONG!"
        sleep(1)
        @player1.turn = false
        @player2.turn = true
        puts "The corrent answer was #{@answer}."
        life
        win?
      else
        @player2.life -= 1
        sleep(1)
        puts "#{@player2.name}: WRONG!"
        sleep(1)
        @player1.turn = true
        @player2.turn = false
        puts "The corrent answer was #{@answer}."
        life
        win?
      end
    end
  end

  def life
    sleep(1)
    puts "  Current score: "
    puts "#{@player1.name}: #{@player1.life.to_s}/3 -- #{@player2.name}: #{@player2.life.to_s}/3}"
  end

  def turn
    question
    check_answer
  end

  def game_over?
    @life <= 0
  end

  def win?
    if @player1.life == 0
      sleep(1)
      puts ' ****** GAME OVER ******'
      sleep(1)
      puts "#{@player2.name} wins!"
      sleep(1)
      puts 'Thank you, come again!'
    elsif @player2.life == 0
      puts ' ****** GAME OVER ******'
      sleep(1)
      puts "#{@player1.name} wins!"
      sleep(1)
      puts 'Thank you, come again!'
    else
      turn
    end
  end

end