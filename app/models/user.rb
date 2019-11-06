class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :invitable

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :profile_pic, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

  validates_acceptance_of :terms
  attr_accessor :terms

  has_many :invitations, class_name: 'User', as: :invited_by
  has_many :posts
  has_many :comments
  has_many :gallery_pics
  has_many :gallery_pic_comments

  def activation_status
    if self.is_active
      "Active"
    else
      "Inactive"
    end
  end

  def active_for_authentication?
    super && self.is_active
  end

  def admin
    self.is_admin?
  end

  def thredded_user_name
    if self.name
      self.name
    else
      '--'
    end
  end
end
