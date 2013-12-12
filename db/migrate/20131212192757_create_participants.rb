class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name, null: false
      t.string :email
      t.string :number
      t.integer :santa_id

      t.timestamps
    end
  end
end
