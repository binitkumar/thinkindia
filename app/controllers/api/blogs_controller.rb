class Api::BlogsController < ApplicationController

  def index
    @posts = Post.where(accepted: true).order(:updated_at)

    render json: @posts.collect{|post| 
      {
        id: post.id, 
        title: post.title, 
        short_message: ActionController::Base.helpers.strip_tags(post.content)[0..50],
        slug: post.slug
      }
    }.to_json
  end

  def show
    blog = Post.friendly.find(params[:id])

    if blog
      render json: {
        status: "success",
        id: blog.id, 
        title: blog.title, 
        content: blog.content,
        posted_on: blog.created_at.strftime("%d/%m/%Y")
      }.to_json
    else
      render json: {
        status: "failure",
        message: "Record not found"
      }
    end
  end
end
