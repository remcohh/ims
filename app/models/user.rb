class User < ActiveRecord::Base
  belongs_to :designation
  belongs_to :project
  
  has_and_belongs_to_many :risk_registers #risk responsibility
  has_secure_password

  USER_ROLES = [["SysAdmin", 1], ["Corporate Risk Manager", 2], ["Project Risk Manager", 3], ["Risk Creator", 4], ["Risk Viewer", 5]]

  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, uniqueness: {case_sensitive: false}
  validates :first_name, :last_name, :designation, :department, :project, presence: true

  validates :role, inclusion: USER_ROLES.map {|s| s[1]}
end
