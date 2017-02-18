module SearchesHelper
    def advance_search(seach)
        risks = RiskRegister.all
        risks = risks.where(project: search[:project])
    end
end
