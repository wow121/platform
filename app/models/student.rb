class Student < ActiveRecord::Base
	attr_accessible :name,:password,:number,:grade,:token,:myclass
end
