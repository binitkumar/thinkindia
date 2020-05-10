class CalledFriend < ApplicationRecord
  belongs_to :call_your_friend

  validates_presence_of :name, :contact_no, :institution, :department
end
