class GameController < ApplicationController
  before_action :set_game, only: [:index, :move]

  def index
  end

  def move
    position = params[:position].to_i
    @game.make_move(position)
    redirect_to root_path
  end

  def destroy
    Game.destroy_all
    redirect_to root_path
  end

  private

  def set_game
    @game = Game.first_or_create
  end
end
