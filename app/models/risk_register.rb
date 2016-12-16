class RiskRegister < ActiveRecord::Base
  belongs_to :project
  belongs_to :category
  belongs_to :user

  RISK_PROBABILITY = ["High", "Medium", "Low"]
  RISK_IMPACT = ["High", "Medium", "Low"]

  has_and_belongs_to_many :categories 

  validates :project, :category_ids, presence: true
  validates :probability, inclusion: RISK_PROBABILITY
  validates :impact, inclusion: RISK_IMPACT
end
