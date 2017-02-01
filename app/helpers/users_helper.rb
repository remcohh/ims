module UsersHelper
    def check_user_role(role)
        case role
            when 1 then "SysAdmin"
            when 2 then "Corporate Risk Manager"
            when 3 then "Risk Manager"
            when 4 then "Risk Creator"
            when 5 then "Risk Viewer"    
        end
    end
end
