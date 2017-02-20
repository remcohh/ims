module SearchesHelper
    def search(query)
        risks = RiskRegister.where(approved: true)
        risks = risks.where(project: query[:project]) unless query[:project].blank?
        risks = risks.where(probability: query[:probability]) unless query[:probability].blank?
        risks = risks.where(impact: query[:impact]) unless query[:impact].blank?
        unless query[:mitigation_target_from].blank? && query[:mitigation_target_to].blank?
            risks = risks.where(["target_date >= ? AND target_date <= ?", query[:mitigation_target_from], query[:mitigation_target_to]])
        end
        category_ids = query[:categories].reject { |c| c.empty? }
        if category_ids.size > 0
            risks = risks.joins(:categories).where(categories: {id: category_ids}).distinct 
        end
        return risks
    end
end
