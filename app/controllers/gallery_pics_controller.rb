class GalleryPicsController < ApplicationController
  before_action :set_gallery_pic, only: [:show, :edit, :update, :destroy, :add_tag, :remove_tag]
  before_action :authenticate_user!, except: [:index]

  load_and_authorize_resource only: [:show]

  # GET /gallery_pics
  # GET /gallery_pics.json
  def index
    @gallery_pics = GalleryPic.where(published: true, pic_collection: params[:collection]).paginate(page: params[:page], per_page: 15)
    @user_gallery_pics = current_user.gallery_pics.where(pic_collection: params[:collection]).paginate(page: params[:my_pics_page], per_page: 15) if current_user
  end

  # GET /gallery_pics/1
  # GET /gallery_pics/1.json
  def show
    authorize! :read, @gallery_pic
    @gallery_pic_comment = GalleryPicComment.new
  end

  def add_tag
    @gallery_pic.tag_list.add(params[:tag])
    @gallery_pic.save
    redirect_to @gallery_pic
  end

  def remove_tag
    @gallery_pic.tag_list.remove(params[:tag])
    @gallery_pic.save
    redirect_to @gallery_pic
  end

  # GET /gallery_pics/new
  def new
    @gallery_pic = GalleryPic.new
  end

  # GET /gallery_pics/1/edit
  def edit
  end

  # POST /gallery_pics
  # POST /gallery_pics.json
  def create
    @loaded_photos = []

    params[:gallery_pic][:picture].each do |pic|
      @photo = GalleryPic.new(photo: pic, user_id: current_user.id, pic_collection: params[:collection])
      @photo.save
      @loaded_photos << @photo
    end
  
    respond_to do |format|
      format.html { render json: {files: @loaded_photo.map{|pic| pic.to_jq_upload} }, content_type: 'text/html', layout: false}
      format.json { render json: {files: @loaded_photos.map{|pic| pic.to_jq_upload} }, status: :created}
    end
  end

  # PATCH/PUT /gallery_pics/1
  # PATCH/PUT /gallery_pics/1.json
  def update
    respond_to do |format|
      if @gallery_pic.update(gallery_pic_params)
        format.html { redirect_to @gallery_pic, notice: 'Gallery pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery_pic }
      else
        format.html { render :edit }
        format.json { render json: @gallery_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_pics/1
  # DELETE /gallery_pics/1.json
  def destroy
    @gallery_pic.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: admin_gallery_pics_path ) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_pic
      @gallery_pic = GalleryPic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_pic_params
      params.require(:gallery_pic).permit(:user_id, :pic_collection, :photo)
    end
end
