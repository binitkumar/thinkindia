class GalleryPic < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

  belongs_to :user
  has_many :gallery_pic_comments

  acts_as_taggable

  def to_jq_upload
    {
      "url" => photo.url(:medium),
      thumbnail_url: photo.url(:thumb),
      "name" => photo_file_name,
      "type" => photo_content_type,
      "size" => photo_file_size,
      "delete_url" => "/gallery_pics/#{self.id}",
      "delete_type" => "DELETE"
    }
  end
end
