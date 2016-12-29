class Project < ActiveRecord::Base
	has_many :users
	validates :name, presence: true
	validates :name, uniqueness: {case_sensitive: false}
	
	def name=(str)
		self[:name] = str.upcase
	end
end
