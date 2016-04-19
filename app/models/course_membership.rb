class CourseMembership < ActiveRecord::Base
  attr_accessible :course_ids, :student_ids
end
