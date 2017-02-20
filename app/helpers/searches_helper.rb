module SearchesHelper
    def search(query)
        risks = RiskRegister.where(approved: true)
        risks = risks.where(project: query[:project]) unless query[:project].blank?
        risks = risks.where(probability: query[:probability]) unless query[:probability].blank?
        risks = risks.where(impact: query[:impact]) unless query[:impact].blank?
        return risks
    end
end
