class Game < ApplicationRecord
  serialize :board, Array

  after_create :setup_game

  def setup_game
    self.board = Array.new(9, nil)
    self.current_player ||= 'X'
    self.winner ||= nil
    self.save
  end

  def make_move(position)
    return false if board[position] || winner

    board[position] = current_player
    self.winner = check_winner
    self.current_player = current_player == 'X' ? 'O' : 'X'
    save
  end

  def check_winner
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]

    winning_combinations.each do |combo|
      if board[combo[0]] && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
        return board[combo[0]]
      end
    end

    return 'Draw' if board.all?
    nil
  end
end
