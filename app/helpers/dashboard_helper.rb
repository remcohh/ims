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
            (date_x.mjd - date_y.mjd)
        else
            (date_y.mjd - date_x.mjd)
        end
    end
    def progress_class(risk_register)
        created_at = Date.parse(risk_register.created_at.strftime("%Y-%m-%d"))
        target_date = risk_register.target_date
        today = Date.today
        
        timeline = date_difference(created_at, target_date)
        remaining_days = date_difference(today, target_date)
        
        fifty_pc = timeline * 0.5
        eighty_pc = timeline - (timeline * 0.8)
        
        if(remaining_days <= fifty_pc && remaining_days > eighty_pc)
            "warning-status"
        elsif(remaining_days <= eighty_pc)
            "danger-status"
        else
            "default-status"
        end
    end
end
