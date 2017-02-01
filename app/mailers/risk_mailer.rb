class RiskMailer < ApplicationMailer
    add_template_helper( RiskRegistersHelper)
    
    default from: "itcellagbp@gmail.com"
    
    def send_risk_notification(risk) #sending mails on approval from responsible officer
        @risk = risk
        recipients = @risk.users.collect { |user| user.email } #collect mitigator emails.
        mail(to: recipients, subject: "Assigment as Risk mitigator for risk no #{@risk.risk_no}.")
    end
    
    def notify_coporate_rm(risk) #sending mails on approval to Corporate Risk Manager
        @risk = risk
        recipients = User.get_corporate_rm 
        mail(to: recipients, subject: "Adding New Risk #{@risk.risk_no} to Risk Register.")
    end
    
    def notify_responsible_officer(risk) #sending mails on creation to Responisble Officer (i.e. Risk Manager)
        @risk = risk
        recipients = @risk.manager.email
        mail(to: recipients, subject: "Assigment as Responsible Officer for the Risk #{@risk.risk_no}.")
    end
end
