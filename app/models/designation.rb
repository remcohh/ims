class Designation < ActiveRecord::Base
	has_many :users
	validates :name, presence: true
	validates :name, uniqueness: {case_sensitive: false}
	
	def name=(str)
		self[:name] = str.split().each { |s| s.capitalize! }.join(' ')
	end
end
