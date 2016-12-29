class Category < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: { case_sensitive: false }
	has_and_belongs_to_many :risk_registers
	
	def name=(str)
		self[:name] = str.split().each { |s| s.capitalize! }.join(' ')
	end
end
