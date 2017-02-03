class DailyEmailer
  include DashboardHelper
  include Delayed::RecurringJob
  run_every 1.day
  run_at '5:22pm'
  timezone 'Kolkata'
  queue 'slow-jobs'
  def perform
    RiskRegister.all.each do |risk| 
      if timeline_gt_80_pc?(risk)
        RiskMailer.notify_risk_status(risk).deliver
      end
      if deadline_over?(risk)
        RiskMailer.notify_delayed_risks(risk).deliver
      end
    end  
  end
end
