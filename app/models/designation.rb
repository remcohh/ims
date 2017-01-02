class Designation < ActiveRecord::Base
	before_destroy :check_users_count
	
	has_many :users
	validates :name, presence: true
	validates :name, uniqueness: {case_sensitive: false}
	
	private
	def check_users_count
		if users.count > 0
			return false
		end
	end
end
