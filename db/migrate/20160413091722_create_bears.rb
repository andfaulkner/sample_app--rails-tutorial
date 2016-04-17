class CreateBears < ActiveRecord::Migration
  def change
    create_table :bears do |t|
      t.string :name
      t.string :type
      t.string :home
      t.integer :age
      t.string :password_digest

      t.timestamps
    end
  end
end
