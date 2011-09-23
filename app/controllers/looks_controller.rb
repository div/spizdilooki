class LooksController < ApplicationController
 
 
  def index
    @looks = Look.published    
  end

  def show
    @look = Look.published.find(params[:id])
    @comments = @look.comments.order('created_at DESC')
    @new_comment = @look.comments.build   
  end

end
