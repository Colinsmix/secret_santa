class AddStateToSanta < ActiveRecord::Migration
  def change
    add_column :santas, :state, :string
  end
end
