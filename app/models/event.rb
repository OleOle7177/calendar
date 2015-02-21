class Event < ActiveRecord::Base
	validates :name, presence: true
	validate :date, presence: true
end
