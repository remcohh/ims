class RiskRegister < ActiveRecord::Base
  belongs_to :project
  belongs_to :category

  RISK_PROBABILITY = ["High", "Medium", "Low"]
  RISK_IMPACT = ["High", "Medium", "Low"]

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users 

  validates :project, :category_ids, presence: true
  validates :probability, inclusion: RISK_PROBABILITY
  validates :impact, inclusion: RISK_IMPACT
end
