class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :accept, :reject]
  before_action :authenticate_user!, except: [:index, :show]

  load_and_authorize_resource only: [:edit]

  # GET /posts
  # GET /posts.json
  def index
    @unpublished_posts = Post.where(accepted: false).where(rejected: false) if current_user && current_user.admin
    @posts = Post.where(accepted: true).order("created_at desc")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new(post_id: @post.id)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize! :edit, @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post sent for moderation.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def accept
    @post.update(rejected: false)
    @post.update(accepted: true)
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      format.json { render :show, status: :ok, location: @post }
    end 
  end

  def reject
    @post.update(accepted: false)
    @post.update(rejected: true)
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      format.json { render :show, status: :ok, location: @post }
    end 
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :is_published, :is_moderated)
    end
end
