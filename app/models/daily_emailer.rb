class DailyEmailer
  include DashboardHelper
  include Delayed::RecurringJob
  run_every 1.day
  run_at '12:00pm'
  timezone 'Kolkata'
  queue 'slow-jobs'
  def perform
    RiskRegister.all.each do |risk| 
      if check_progress(risk_register) == "80pc"
        RiskMailer.delay.notify_risk_status(risk_register)
      end
    end
  end
end
