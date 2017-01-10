class RiskMailer < ApplicationMailer
    default from: "itcellagbp@gmail.com"
    
    def send_risk_notification(risk_register)
        @risk_register = risk_register
        recipients = @risk_register.users.collect { |user| user.email }
        
        mail(to: recipients, subject: "You have been assigned as Risk mitigator.")
    end
    
    def send_notification_to_rm(risk_register)
        @risk_register = risk_register
        recipients = @risk_register.users.collect { |user| user.email }
        recipients = recipients.zip(User.get_project_rm(@risk_register.project)).select { |e| e.first != e.last }
        recipients << User.get_corporate_rm

        mail(to: recipients, subject: "A new Risk has been created for #{@risk_register.project.name}.")
    end
end
