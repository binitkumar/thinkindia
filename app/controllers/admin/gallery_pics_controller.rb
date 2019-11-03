class Admin::GalleryPicsController < ApplicationController
  before_action :set_gallery_pic, except: [:index]
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @unpublished_pics = GalleryPic.where(published: false, private: false)
    @published_pics = GalleryPic.where(published: true, private: false)
    @private_pics = GalleryPic.where(private: true)
  end

  def mark_private
    @gallery_pic.update_attribute(:private, true)
    redirect_back(fallback_location: admin_gallery_pics_path)
  end

  def publish
    @gallery_pic.update_attribute(:published, true)
    redirect_back(fallback_location: admin_gallery_pics_path)
  end

  def unpublish
    @gallery_pic.update_attribute(:published, false)
    redirect_back(fallback_location: admin_gallery_pics_path)
  end

  def remove_private
    @gallery_pic.update_attribute(:private, false)
    redirect_back(fallback_location: admin_gallery_pics_path)
  end

  def set_gallery_pic
    @gallery_pic = GalleryPic.find params[:id]
  end
end
