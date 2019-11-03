class GalleryPicCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @gallery_pic_comment = GalleryPicComment.new(gallery_pic_comment_params)
    @gallery_pic_comment.user = current_user

    if @gallery_pic_comment.save
      redirect_to @gallery_pic_comment.gallery_pic, notice: 'Comment added successfully'
    else
      redirect_to @gallery_pic_comment.gallery_pic, notice: 'Failed to add comment'
    end
  end

  def gallery_pic_comment_params
    params.require(:gallery_pic_comment).permit(:content, :gallery_pic_id, :user_id)
  end
end
