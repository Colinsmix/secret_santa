class AddUserToSanta < ActiveRecord::Migration
  def change
    add_column :santas, :user_id, :integer, null: false
  end
end
