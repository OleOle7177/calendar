class Event < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validate :date, presence: true
end
