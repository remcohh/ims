class DailyEmailer
  include DashboardHelper
  include Delayed::RecurringJob
  run_every 1.day
  run_at '10:30am'
  timezone 'Kolkata'
  queue 'slow-jobs'
  def perform
    RiskRegister.where(approved: true, status: false).each do |risk| 
      if timeline_gt_80_pc?(risk)
        RiskMailer.notify_80pc_risk_status(risk).deliver
      end
      if timeline_eq_50_pc?(risk)
        RiskMailer.notify_50pc_risk_status(risk).deliver
        risk.update_attribute(:fifty_pc, true)
      end
      if deadline_over?(risk)
        RiskMailer.notify_delayed_risks(risk).deliver
      end
    end  
  end
end
