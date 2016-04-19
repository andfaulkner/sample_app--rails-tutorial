class CreateBirthdays < ActiveRecord::Migration
  def change
    create_table :birthdays do |t|
      t.integer :day
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
