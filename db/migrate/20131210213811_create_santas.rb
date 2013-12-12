class CreateSantas < ActiveRecord::Migration
  def change
    create_table :santas do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
