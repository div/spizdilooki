class Look < ActiveRecord::Base
  after_create :fetch_lookatmedata
  scope :published, :conditions => {:processing => false}
  mount_uploader :image, ImageUploader
  
  def fetch_image
    if self.source_img_url
      logger.info("Processing #{self.source_img_url} for #{self.name}")
      self.remote_image_url = self.source_img_url # Saving image with carrierwave
      self.image.store!
      self.processing = false
    end
  end
  
  private 
  
  def fetch_lookatmedata
    self.processing = true
    Resque.enqueue(FetchData, self.id)
  end
  
end
