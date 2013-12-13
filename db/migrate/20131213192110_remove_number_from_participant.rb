class RemoveNumberFromParticipant < ActiveRecord::Migration
  def change
    remove_column :participants, :number
  end
end
