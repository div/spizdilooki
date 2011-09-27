class LooksController < ApplicationController
   
  def index
    @looks = Look.published.order('lookatmeid DESC').page(params[:page])
    
    respond_to do |format|
        format.js
        format.html # index.html.erb
        format.xml  { render :xml => @looks }
    end    
  end

  def show
    @look = Look.published.find(params[:id])    
    @comments = @look.comments.order('created_at DESC')
    @new_comment = @look.comments.build   
  end

end
