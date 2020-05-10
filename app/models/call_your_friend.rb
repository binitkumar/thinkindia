class CallYourFriend < ApplicationRecord

  has_many :called_friends

  accepts_nested_attributes_for :called_friends
end
