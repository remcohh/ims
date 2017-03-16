class RiskMailer < ApplicationMailer
    add_template_helper( RiskRegistersHelper)
    include DashboardHelper
    
    default from: "itcellagbp@gmail.com"
    
    def send_risk_notification(risk) #sending mails on approval from responsible officer to all risk mitigators
        @risk = risk
        recipients = @risk.users.collect { |user| user.email } #collect mitigator emails.
        mail(to: recipients, subject: "Assigment as Risk mitigator for risk no #{@risk.risk_no}.")
    end
    
    def notify_coporate_rm(risk) #sending mails on approval to Corporate Risk Manager
        @risk = risk
        recipients = User.get_corporate_rm 
        mail(to: recipients, subject: "New Risk #{@risk.risk_no} added to Risk Register.")
    end
    
    def notify_responsible_officer(risk) #sending mails on creation to Responisble Officer (i.e. Risk Manager)
        @risk = risk
        recipients = @risk.manager.email
        mail(to: recipients, subject: "Assigment as Responsible Officer for the Risk #{@risk.risk_no}.")
    end
    
    def notify_80pc_risk_status(risk) #sending recurring mail to responsible officer if mitigation timeline has crossed 80%.
        @risk = risk
        @days_remaining = date_difference(Date.today, @risk.target_date)
        
        recipients = @risk.users.collect { |user| user.email } #collect mitigator emails.
        recipients << @risk.manager.email #collect responsible officer email.
        recipients.uniq!
        
        if @days_remaining < 0
            mail(to: recipients, subject: "ALERT: Risk #{@risk.risk_no} mitigation period is completed.")
        else
            mail(to: recipients, subject: "ALERT: Risk #{@risk.risk_no} mitigation period is about to complete.")
        end
    end
    
    def notify_50pc_risk_status(risk) #sending recurring mail to responsible officer if mitigation timeline has crossed 50%.
        @risk = risk
        
        recipients = @risk.users.collect { |user| user.email } #collect mitigator emails.
        recipients << @risk.manager.email #collect responsible officer email.
        recipients.uniq!
        
        mail(to: recipients, subject: "ALERT: 50% Mitigation period is completed for Risk #{@risk.risk_no}.")
    end
    
    def notify_delayed_risks(risk)
        @risk = risk
        recipients = []
        recipients << @risk.manager.email
        recipients << User.get_corporate_rm
        mail(to: recipients, subject: "Risk mitigation deadline over for risk #{@risk.risk_no}.")
    end
end
