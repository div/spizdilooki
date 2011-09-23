class Look < ActiveRecord::Base
  after_create :fetch_lookatmedata
  scope :published, :conditions => {:processing => false}
  
  
  
  private 
  
  def fetch_lookatmedata
    self.processing = true
    Resque.enqueue(FetchData, self.id)
  end
  
end
