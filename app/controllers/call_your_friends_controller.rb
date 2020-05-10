class CallYourFriendsController < ApplicationController
  before_action :set_call_your_friend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create, :show]
  before_action :authenticate_admin!, except: [:new, :create, :show]
  # GET /call_your_friends
  # GET /call_your_friends.json
  def index
    @call_your_friends = CallYourFriend.all
  end

  # GET /call_your_friends/1
  # GET /call_your_friends/1.json
  def show
  end

  # GET /call_your_friends/new
  def new
    @call_your_friend = CallYourFriend.new
  end

  # GET /call_your_friends/1/edit
  def edit
  end

  # POST /call_your_friends
  # POST /call_your_friends.json
  def create
    @call_your_friend = CallYourFriend.new(call_your_friend_params)

    respond_to do |format|
      if verify_recaptcha(model: @call_your_friend) && @call_your_friend.save
        format.html { redirect_to @call_your_friend, notice: 'Call your friend was successfully created.' }
        format.json { render :show, status: :created, location: @call_your_friend }
      else
        format.html { render :new }
        format.json { render json: @call_your_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /call_your_friends/1
  # PATCH/PUT /call_your_friends/1.json
  def update
    respond_to do |format|
      if @call_your_friend.update(call_your_friend_params)
        format.html { redirect_to @call_your_friend, notice: 'Call your friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @call_your_friend }
      else
        format.html { render :edit }
        format.json { render json: @call_your_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_your_friends/1
  # DELETE /call_your_friends/1.json
  def destroy
    @call_your_friend.destroy
    respond_to do |format|
      format.html { redirect_to call_your_friends_url, notice: 'Call your friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_your_friend
      @call_your_friend = CallYourFriend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def call_your_friend_params
      params.require(:call_your_friend).permit(:your_name, called_friends_attributes: [:id, :name, :contact_no,
        :whatsapp_no, :institution, :department, :_destroy])
    end
end
