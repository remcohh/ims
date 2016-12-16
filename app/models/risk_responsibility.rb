class RiskResponsibility < ActiveRecord::Base
  belongs_to :risk_register
  belongs_to :user
end
