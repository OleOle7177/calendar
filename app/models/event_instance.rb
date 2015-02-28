class EventInstance 
	include ActiveModel::AttributeMethods

	attr_accessor :name, :date, :event_id, :user_id


		def self.occurrences_between(options = {}) 
		
		start_date = options[:start_date]
		end_date = options[:end_date]
		user_id = options[:current_id]
		results = user_id ? Event.where(user_id: user_id).where("(date > ? AND date < ? AND repeat = ?) OR (date < ? and repeat != ?)", start_date, end_date, 0, end_date, 0) : Event.where("(date > ? AND date < ? AND repeat = ?) OR (date < ? and repeat != ?)", start_date, end_date, 0, end_date, 0)
			
		results.map { |event| 
		event.schedule.occurrences_between(start_date, end_date).map { |date|
			i = EventInstance.new()
			i.name = event.name
			i.date = date.to_date
			i.event_id = event.id
			i.user_id = event.user_id
			i
		}
	}.flatten.sort! {|a,b| a.date <=> b.date}	
	end




end