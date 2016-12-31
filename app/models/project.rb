class Project < ActiveRecord::Base
	has_many :users
	has_many :risk_registers
	
	validates :name, presence: true
	validates :name, uniqueness: {case_sensitive: false}
	
	def name=(str)
		self[:name] = str.upcase
	end
end
