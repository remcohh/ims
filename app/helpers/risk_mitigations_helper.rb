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
            "label label-success"
        else
            "label label-danger"
        end
    end

    def button_class(risk)
        if(risk.status?)
            "btn btn-success btn-sm"
        else
            "btn btn-danger btn-sm"
        end
    end
end
