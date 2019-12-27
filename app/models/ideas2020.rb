class Ideas2020 < ApplicationRecord
  has_attached_file :idea
  validates_attachment_content_type :idea, :content_type => ['application/pdf', 'application/msword', 'text/plain']

  validates_presence_of :name
  validates_presence_of :email
end
