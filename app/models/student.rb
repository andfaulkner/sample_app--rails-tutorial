class Student < ActiveRecord::Base
	has_and_belongs_to_many :courses
  has_one :birthday
  attr_accessible :age, :name
end
