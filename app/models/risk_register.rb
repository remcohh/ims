class RiskRegister < ActiveRecord::Base
  belongs_to :project
  belongs_to :category

  RISK_PROBABILITY = ["High", "Medium", "Low"]
  RISK_IMPACT = ["High", "Medium", "Low"]

  has_many :risk_mitigations
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users
  belongs_to :creator, class_name: "User", foreign_key: "created_by"
  belongs_to :updator, class_name: "User", foreign_key: "updated_by"

  validates :project, :category_ids, :user_ids, presence: true
  validates :probability, inclusion: RISK_PROBABILITY
  validates :impact, inclusion: RISK_IMPACT

end
