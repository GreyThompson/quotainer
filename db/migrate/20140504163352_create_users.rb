class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.date :date_of_birth
      t.text :bio

      t.timestamps
    end
  end
end
