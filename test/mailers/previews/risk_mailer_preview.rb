# Preview all emails at http://localhost:3000/rails/mailers/risk_mailer
class RiskMailerPreview < ActionMailer::Preview
    def send_risk_notification
        RiskMailer.send_risk_notification(RiskRegister.find(32))
    end
    def notify_coporate_rm
        RiskMailer.notify_coporate_rm(RiskRegister.find(32))
    end
    def notify_responsible_officer
        RiskMailer.notify_responsible_officer(RiskRegister.find(32))
    end
    def notify_80pc_risk_status
        RiskMailer.notify_80pc_risk_status(RiskRegister.find(36))
    end
    def notify_50pc_risk_status
        RiskMailer.notify_50pc_risk_status(RiskRegister.find(36))
    end
    def notify_delayed_risks
        RiskMailer.notify_delayed_risks(RiskRegister.find(36))
    end
end
