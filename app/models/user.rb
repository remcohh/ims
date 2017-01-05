class User < ActiveRecord::Base
  before_destroy :check_user_references
  
  belongs_to :designation
  belongs_to :project
  
  has_many :risks, class_name: "RiskRegister", foreign_key: "created_by"
  has_and_belongs_to_many :risk_registers #risk mitigators
  
  has_secure_password

  USER_ROLES = [["SysAdmin", 1], ["Corporate Risk Manager", 2], ["Project Risk Manager", 3], ["Risk Creator", 4], ["Risk Viewer", 5]]

  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, uniqueness: {case_sensitive: false}
  validates :first_name, :last_name, :designation, :department, :project, presence: true

  validates :role, inclusion: USER_ROLES.map {|s| s[1]}
  
  private
  def check_user_references
    if risk_registers.count > 0 || risks.count > 0
      return false
    end
  end
end
