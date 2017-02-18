class RiskReportPdf < Prawn::Document
    include RiskRegistersHelper
    def initialize(risk_register, title)
        super({:top_margin => 15, :page_size => 'A4', :page_layout => :landscape })
        @risk_register = risk_register
        @title = title
        gen_header
        move_down 15
        gen_page(@risk_register)
        #stroke_axis
    end

    private
    def gen_header
        
        filename = "#{Rails.root}/app/assets/images/logo.png"
        image filename, width: 50, height: 50
    end
    
    def gen_page(risk_register)
        text @title, align: :center, font: "Helvetica ", style: :bold, size: 12
        move_down 3
        data = [["Risk No","Category","Description","Probability","Impact", "Project", "Status", "Mitigation Plan","Target Mitigation Date","Responsible Officer"]]
        risk_register.each do |risk|
            data += [[risk.risk_no, append_category_names(risk.categories), risk.description, risk.probability, risk.impact,
                      risk.project.name, risk_status(risk.status), risk.mitigation_plan, format_target_date(risk.target_date), user_info(risk.manager)    
                    ]]
        end
        
        table data, column_widths: [52,70,160,58,40,70,53,140,64,63], :header => true, 
                width: 770, cell_style: { size: 10, font: "Times-Roman", border_width: 0.5 } do
            
            row(0).font_style = :bold
            row(0).size = 10
        end
    end

end
