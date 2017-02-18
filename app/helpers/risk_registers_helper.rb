module RiskRegistersHelper
    def format_target_date(date)
        if date
            date.strftime("%d-%b-%Y")
        else
            "N/A"
        end
    end
    
    def append_category_names(categories)
        category_array = []
        categories.each do |category|
            category_array.push(category.name)
        end
        category_array.join(", ")
    end
    
    def append_mitigator_emails(mitigators)
        mitigator_array = []
        mitigators.each do |mitigator|
            mitigator_array.push(mitigator.email)
        end
        mitigator_array.join(", ")
    end
    
    def two_digit(value)
        if value < 9
            '0' + value.to_s
        else
            value.to_s
        end
    end
    
    def get_year_yy
        Date.today.strftime("%Y").last(2)
    end
    
    def increment_by_one_s(value)
        (value + 1).to_s
    end
    
    def user_info(user)
        if user
            name =  user.first_name + " " + user.last_name
            designation = user.designation.name
            name + ", " + designation
        else
            "N/A"
        end
    end
    
    def risk_status(status)
        if(status)
            "Completed"
        else
            "Pending"
        end
    end
end
