class CallYourFriend < ApplicationRecord

  has_many :called_friends

  accepts_nested_attributes_for :called_friends, allow_destroy: true

  validates_presence_of :your_name
end
