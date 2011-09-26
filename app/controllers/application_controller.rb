class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :instantiate_controller_and_action_names

  def instantiate_controller_and_action_names
        @current_id = params[:id]
        
  end
end
