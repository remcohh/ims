module RiskRegistersHelper
    def format_target_date(date)
        date.strftime("%d-%m-%Y")
    end
    
    def append_category_names(categories)
        category_array = []
        categories.each do |category|
            category_array.push(category.name)
        end
        category_array.join(", ")
    end
    
    def append_mitigator_names(mitigators)
        mitigator_array = []
        mitigators.each do |mitigator|
            mitigator_array.push(mitigator.email)
        end
        mitigator_array.join(", ")
    end
end
