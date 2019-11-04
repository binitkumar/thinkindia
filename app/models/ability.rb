# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, accepted: true
    can :read, GalleryPic, published: true

    if user.present?
      can :edit, Post, user_id: user.id
      can :read, GalleryPic, user_id: user.id

      if user.admin
        can :manage, Post
        can :manage, GalleryPic

      end
    end
  end
end
