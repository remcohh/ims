module RiskMitigationsHelper
    def mitigation_status(risk)
        if risk.status?
            "Completed"
        else
            "Pending"
        end
    end
    def mitigation_status_class(risk)
        if risk.status?
            "completed"
        else
            "pending"
        end
    end

    def button_class(risk)
        if(risk.status?)
            "btn btn-success"
        else
            "btn btn-danger"
        end
    end
end
