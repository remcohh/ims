class RiskReportPdf < Prawn::Document
    include RiskRegistersHelper
    def initialize(risk_register, title)
        super({:top_margin => 15, :page_size => 'A4', :page_layout => :landscape })
        @risk_register = risk_register
        @title = title
        
        repeat :all do
          bounding_box [bounds.left, bounds.top], width: bounds.width do
            gen_header
          end  
          #Create a bounding box and move it up 18 units from the bottom boundry of the page
          bounding_box [bounds.left, bounds.bottom + 18], width: bounds.width do
            text "This report is generated from NEEPCO Risk Management System. Being system generated report signature is not required.", size: 9, align: :center
          end
        end
        
        #Create another box that is placed on the page after our footer is
        bounding_box [bounds.left, bounds.top-70], width: bounds.width, height: bounds.height - 86 do
            gen_page(@risk_register)
        end
    end

    private
    def gen_header
        filename = "#{Rails.root}/app/assets/images/logo.png"
        image filename, width: 50, height: 50
        text @title, align: :center, font: "Helvetica ", style: :bold, size: 12 
        bounding_box [bounds.left, bounds.top - 15], width: bounds.width do
          text "NEEPCO RISK MANAGEMENT SYSTEM", align: :center, font: "Helvetica ", style: :bold, size: 16 
        end
    end
    
    def gen_page(risk_register)
        data = [["Sl. No.", "Risk No","Category","Description","Probability","Impact", "Project", "Status", "Mitigation Plan","Target Mitigation Date","Responsible Officer"]]
        count = 1
        risk_register.each do |risk|
            data += [[count.to_s+".", risk.risk_no, append_category_names(risk.categories), risk.description, risk.probability, risk.impact,
                      risk.project.name, risk_status(risk.status), risk.mitigation_plan, format_target_date(risk.target_date), user_info(risk.manager)    
                    ]]
            count = count+1        
        end
        
        table data, column_widths: [30,52,70,150,58,40,70,53,120,63,64], :header => true, 
                width: 770, cell_style: { size: 10, font: "Times-Roman", border_width: 0.5 } do
            
            row(0).font_style = :bold
            row(0).size = 10
            column(0).font_style = :bold
        end
    end

end
