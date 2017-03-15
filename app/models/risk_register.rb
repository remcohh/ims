class RiskRegister < ActiveRecord::Base
  include RiskRegistersHelper
  before_create :generate_risk_no
  
  RISK_PROBABILITY = ["High", "Medium", "Low"]
  RISK_IMPACT = ["High", "Medium", "Low"]

  has_many :risk_mitigations, :dependent => :destroy
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users #risk mitigators
  belongs_to :project
  belongs_to :creator, class_name: "User", foreign_key: "created_by"
  belongs_to :updator, class_name: "User", foreign_key: "updated_by"
  belongs_to :manager, class_name: "User", foreign_key: "responsible_officer"

  validates :project, :description, :target_date, :category_ids, :user_ids, :responsible_officer, presence: true
  validates :probability, inclusion: RISK_PROBABILITY
  validates :impact, inclusion: RISK_IMPACT
  validates :risk_no, uniqueness: true
  validate :check_date
  
  def self.search(risk_no)
		if risk_no
		  self.where(['risk_no LIKE ?', "%#{risk_no}%"])
		else
		  self.all
		end
  end
  
  def self.project_wise(project)
		if project.present?
		  self.where(project_id: project)
		else
		  self.all
		end
  end
  
  def self.critical_risk_count
    self.where(probability: "High", impact: "High", approved: true, status: false).count
  end
  
  def self.unapproved_risk_count(project='all')
    if project == 'all'
      self.where(approved: false, status: false).count
    else
      self.where(approved: false, status: false, project: project).count
    end
  end
  
  def self.completed_risk_count(project='all')
    if project == 'all'
      self.where(approved: true, status: true).count
    else
      self.where(approved: true, status: true, project: project).count
    end
  end
  
  def self.pending_risk_count(project='all')
    if project == 'all'
      self.where(approved: true, status: false).count
    else
      self.where(approved: true, status: false, project: project).count
    end
  end
  
  private
  #generate unique risk no based on 2-digit project code, 2-digit year, and 4-digit autoincrement integer
  def generate_risk_no
    pro = Project.find(self[:project_id])
    if(pro.risk_registers.count == 0)
      last_risk_id = 1000;
    else
      last_risk_id = pro.risk_registers.last.risk_no.last(4).to_i
    end
    self[:risk_no] = two_digit(project.id) + get_year_yy + increment_by_one_s(last_risk_id)
  end
  
  #check if target date is greater than today's date
  def check_date
    if target_date.present? && target_date < Date.today
      errors.add(:target_date, "should be greater than today's date")
    end
  end
end
