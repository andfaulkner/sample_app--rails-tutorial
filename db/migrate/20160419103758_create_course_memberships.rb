class CreateCourseMemberships < ActiveRecord::Migration
  def change
    create_table :course_memberships do |t|
      t.integer :student_ids
      t.integer :course_ids

      t.timestamps
    end
  end
end
