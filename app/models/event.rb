class Event < ActiveRecord::Base
	include IceCube
	belongs_to :user

	validates :name, presence: true
	validate :date, presence: true

	def schedule
		Schedule.new(self.date) do |s|
			case self.repeat
				when 1 
				 	s.add_recurrence_rule IceCube::Rule.daily
				when 7
					s.add_recurrence_rule IceCube::Rule.weekly
				when 30
					s.add_recurrence_rule IceCube::Rule.monthly
				when 365
					s.add_recurrence_rule IceCube::Rule.yearly
				end			
		end
	end
end
