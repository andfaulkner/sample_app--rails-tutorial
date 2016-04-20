class Birthday < ActiveRecord::Base
	belongs_to :student
  attr_accessible :day, :month, :year
end
