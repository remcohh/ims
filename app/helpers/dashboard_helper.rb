module DashboardHelper
    def format_date(date)
        if date
            date.strftime("%d-%b-%Y")
        else
            "N/A"
        end
    end
    def date_difference(date_x, date_y)
        date_y.mjd - date_x.mjd #Returns the difference of modified Julian day number
    end
    
    def progress_class(risk_register)
        created_at = Date.parse(risk_register.created_at.strftime("%Y-%m-%d"))
        target_date = risk_register.target_date
        today = Date.today
        
        timeline = date_difference(created_at, target_date)
        remaining_days = date_difference(today, target_date)
        
        fifty_pc = timeline * 0.5
        eighty_pc = timeline - (timeline * 0.8)
        
        #if timeline is greater than 50% of the mitigation duration but less than 80% duration.
        if(remaining_days <= fifty_pc && remaining_days > eighty_pc)
            "warning-status"
        elsif(remaining_days <= eighty_pc && remaining_days >= 0) #if timeline is greater than 80% of the mitigation duration.
            "danger-status"
        elsif remaining_days < 0
            "critical-status"    
        else
            "default-status"
        end
    end
    
    #check if timeline is greater than 80% of the mitigation duration.
    def timeline_gt_80_pc?(risk_register)
        created_at = Date.parse(risk_register.created_at.strftime("%Y-%m-%d"))
        target_date = risk_register.target_date
        today = Date.today
    
        timeline = date_difference(created_at, target_date)
        remaining_days = date_difference(today, target_date)
        
        eighty_pc = timeline - (timeline * 0.8)
    
        return remaining_days <= eighty_pc && remaining_days >= 0
    end
    
    #check if risk mitigation deadline is over.
    def deadline_over?(risk_register)
        return date_difference(Date.today, risk_register.target_date) < 0
    end
end
