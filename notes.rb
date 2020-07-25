require 'pry'

class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  
  def initialize(board = Array.new(9, " "))
    @board = board
  end  
  
  def display_board
    puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
    puts "-----------"
    puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
    puts "-----------"
    puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token="X")
    self.board[index] = token
  end  
  
  def position_taken?(index)
    if self.board[index] == "X"|| self.board[index] == "O"
      true
    elsif self.board[index] == " "|| self.board[index] == ""
      false
    else
      nil
    end
  end
  
  def valid_move?(index)
    if index > 8 || index < 0
      false
    elsif position_taken?(index)
      false
    else
      true
    end
  end
  
  def turn_count
    count = 0
    board.each do |char|
      count += 1 if char == "X" || char == "O"
    end
    count
  end
  
  def current_player
    self.turn_count.even? ? "X" : "O"
  end
  
  def turn
    puts "Please enter a number from 1-9."
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      "That move is invalid. Please enter a new number from 1-9."
      input = gets.chomp
    end
  end
  
  def full?
    turn_count > 9 ? true : false
  end
  
  
  def won?
    
  end
  
end