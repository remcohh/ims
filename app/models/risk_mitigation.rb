class RiskMitigation < ActiveRecord::Base
  belongs_to :risk_register
  
  validates :mitigation_step, presence: true
end
