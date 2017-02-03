module DashboardHelper
    def format_date(date)
        if date
            date.strftime("%d-%b-%Y")
        else
            "N/A"
        end
    end
    def date_difference(date_x, date_y)
        if(date_x < date_x)
            (date_x.mjd - date_y.mjd) #Returns the difference of modified Julian day number
        else
            (date_y.mjd - date_x.mjd)
        end
    end
    
    def progress_class(risk_register)
        status =  check_progress(risk_register)
        if status == "50pc"
            "warning-status"    #css class name for 50% 
        elsif status == "80pc" 
            "danger-status"     #css class name for 80%
        else
            "default-status"    #css class name for less than 50%
        end
    end
    
    def check_progress(risk_register)
        created_at = Date.parse(risk_register.created_at.strftime("%Y-%m-%d"))
        target_date = risk_register.target_date
        today = Date.today
        
        timeline = date_difference(created_at, target_date)
        remaining_days = date_difference(today, target_date)
        
        fifty_pc = timeline * 0.5
        eighty_pc = timeline - (timeline * 0.8)
        
        #if timeline is greater than 50% of the mitigation duration but less than 80% duration.
        if(remaining_days <= fifty_pc && remaining_days > eighty_pc)
            "50pc"
        elsif(remaining_days <= eighty_pc) #if timeline is greater than 80% of the mitigation duration.
            "80pc"
        else
            "default"
        end
    end
end
