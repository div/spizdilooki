class LooksController < ApplicationController
  def index
    @looks = Look.published
    respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @looks }
    end
  end

  def show
  end

end
