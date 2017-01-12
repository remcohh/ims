class RiskMailer < ApplicationMailer
    add_template_helper( RiskRegistersHelper)
    
    default from: "itcellagbp@gmail.com"
    
    def send_risk_notification(risk) #sending mails on risk creation
        @risk = risk
        recipients = @risk.users.collect { |user| user.email } #collect mitigator emails.
        mail(to: recipients, subject: "Assigment as Risk mitigator for risk no #{@risk.risk_no}.")
    end
    
    def send_risk_reminder(risk) #sending mails on risk update
        @risk = risk
        recipients = @risk.users.collect { |user| user.email } #collect mitigator emails.
        mail(to: recipients, subject: "REMINDER: Assigment as Risk mitigator for risk no #{@risk.risk_no}.")
    end
    
    def send_notification_to_rm(risk)
        @risk = risk
        mitigators = @risk.users.collect { |user| user.email }
        risk_managers = User.get_project_rm(@risk.project)
        recipients = risk_managers - mitigators #exclude project managers who are also risk mitigator for the risk.
        recipients << User.get_corporate_rm
        mail(to: recipients, subject: "New Risk created for #{@risk.project.name}.")
    end
end
