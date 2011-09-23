class Comment < ActiveRecord::Base
  belongs_to :look
  validates_presence_of :text
  attr_accessible :author, :text
end
