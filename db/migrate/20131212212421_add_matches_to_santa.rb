class AddMatchesToSanta < ActiveRecord::Migration
  def change
    add_column :santas, :match, :integer, array: true
  end
end
