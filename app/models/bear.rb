class Bear < ActiveRecord::Base
  attr_accessible :age, :home, :name, :password_digest, :type
end
