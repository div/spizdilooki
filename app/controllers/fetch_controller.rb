require 'fetch_lookids'
class FetchController < ApplicationController
  def fetch_ids
    #that is for testing purposes - this task will be ran by resque_scheduler in the future
    #log("start fetching looks ids form lookatme.ru/looks/")
    Resque.enqueue(FetchLookIds) 
    redirect_to root_path
  end
end