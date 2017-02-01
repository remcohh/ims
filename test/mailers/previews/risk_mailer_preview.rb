# Preview all emails at http://localhost:3000/rails/mailers/risk_mailer
class RiskMailerPreview < ActionMailer::Preview
    def send_risk_notification
        RiskMailer.send_risk_notification(RiskRegister.find(20))
    end
    def notify_coporate_rm
        RiskMailer.notify_coporate_rm(RiskRegister.find(20))
    end
    def notify_responsible_officer
        RiskMailer.notify_responsible_officer(RiskRegister.find(20))
    end
end
