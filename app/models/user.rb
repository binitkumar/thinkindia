class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_acceptance_of :terms
  attr_accessor :terms

  has_many :posts
  has_many :comments

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
