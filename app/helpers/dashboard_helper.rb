module DashboardHelper
    def format_date(date)
        if date
            date.strftime("%d-%b-%Y")
        else
            "N/A"
        end
    end
end
