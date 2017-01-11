class RiskMailer < ApplicationMailer
    add_template_helper( RiskRegistersHelper)
    
    default from: "itcellagbp@gmail.com"
    
    def send_risk_notification(risk_register)
        @risk_register = risk_register
        recipients = @risk_register.users.collect { |user| user.email }
        
        mail(to: recipients, subject: "Assigment as Risk mitigator for risk no #{@risk_register.risk_no}.")
    end
    
    def send_notification_to_rm(risk_register)
        @risk_register = risk_register
        mitigators = @risk_register.users.collect { |user| user.email }
        risk_managers = User.get_project_rm(@risk_register.project)
        recipients = risk_managers - mitigators
        recipients << User.get_corporate_rm
        mail(to: recipients, subject: "New Risk created for #{@risk_register.project.name}.")
    end
end
