class Image < ActiveRecord::Base
  belongs_to :sock
  validates :url, presence: true
end
