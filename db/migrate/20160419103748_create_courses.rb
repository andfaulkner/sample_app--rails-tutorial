class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :topic
      t.integer :code

      t.timestamps
    end
  end
end
