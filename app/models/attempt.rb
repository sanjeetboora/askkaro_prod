class Survey::Attempt < ActiveRecord::Base
	
	def self.as_csv(attempts)
		CSV.generate do |csv|
			byebug
			csv << column_names
			attempts.each do |attempt|
				csv << attempt.attributes.values_at(*column_names)
			end
		end
	end



end


