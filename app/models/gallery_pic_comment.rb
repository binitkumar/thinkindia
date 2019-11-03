class GalleryPicComment < ApplicationRecord
  belongs_to :gallery_pic
  belongs_to :user
end
