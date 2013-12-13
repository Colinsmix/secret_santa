class AddRulesToSanta < ActiveRecord::Migration
  def change
    add_column :santas, :rules, :string
  end
end
