class RiskReport < Prawn::Document
    def initialize(risk_register)
        super({:top_margin => 15, :page_size => 'A4'})
        @risk_register = risk_register
    end
end