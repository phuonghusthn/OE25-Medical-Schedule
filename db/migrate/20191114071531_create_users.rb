class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :address
      t.integer :phone
      t.string :role
      t.string :academy
      t.string :position
      t.integer :experience
      t.integer :room

      t.timestamps
    end
  end
end
