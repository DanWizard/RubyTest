class Event < ActiveRecord::Base
	has_many :comments
	has_many :joins
	validates :desc, :presence => true
  	validates :name, :presence => true
end
