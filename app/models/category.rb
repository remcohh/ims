class Category < ActiveRecord::Base
	before_destroy :check_risk_registers_count
	
	validates :name, presence: true
	validates :name, uniqueness: { case_sensitive: false }
	has_and_belongs_to_many :risk_registers
	
	def name=(str)
		self[:name] = str.split().each { |s| s.capitalize! }.join(' ')
	end
	
	def check_risk_registers_count
		if risk_registers.count > 0
			return false
		end
	end
end
