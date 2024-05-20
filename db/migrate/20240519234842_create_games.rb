class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.text :board
      t.string :current_player
      t.string :winner

      t.timestamps
    end
  end
end
