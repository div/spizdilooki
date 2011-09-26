module ApplicationHelper
  
  def is_active?(page_name)
       
    "active" if params[:id] == page_name 
               
  end
  def is_home?
    "active" if  action_name == 'index' && controller_name == 'looks' 
  end
  
end
