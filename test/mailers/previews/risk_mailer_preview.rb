# Preview all emails at http://localhost:3000/rails/mailers/risk_mailer
class RiskMailerPreview < ActionMailer::Preview
    def send_risk_notification
        RiskMailer.send_risk_notification(RiskRegister.find(8))
    end
    def send_notification_to_rm
        RiskMailer.send_risk_notification(RiskRegister.find(8))
    end
end
