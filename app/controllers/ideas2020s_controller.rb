class Ideas2020sController < ApplicationController
  before_action :set_ideas2020, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create, :show]
  before_action :authenticate_admin!, except: [:new, :create, :show]

  # GET /ideas2020s
  # GET /ideas2020s.json
  def index
    @ideas2020s = Ideas2020.all
  end

  # GET /ideas2020s/1
  # GET /ideas2020s/1.json
  def show
  end

  # GET /ideas2020s/new
  def new
    @ideas2020 = Ideas2020.new
  end

  # GET /ideas2020s/1/edit
  def edit
  end

  # POST /ideas2020s
  # POST /ideas2020s.json
  def create
    @ideas2020 = Ideas2020.new(ideas2020_params)
    success = verify_recaptcha


    respond_to do |format|
      if success && @ideas2020.save
        format.html { redirect_to @ideas2020, notice: 'Ideas2020 was successfully created.' }
        format.json { render :show, status: :created, location: @ideas2020 }
      else
        format.html { render :new }
        format.json { render json: @ideas2020.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas2020s/1
  # PATCH/PUT /ideas2020s/1.json
  def update
    respond_to do |format|
      if @ideas2020.update(ideas2020_params)
        format.html { redirect_to @ideas2020, notice: 'Ideas2020 was successfully updated.' }
        format.json { render :show, status: :ok, location: @ideas2020 }
      else
        format.html { render :edit }
        format.json { render json: @ideas2020.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas2020s/1
  # DELETE /ideas2020s/1.json
  def destroy
    @ideas2020.destroy
    respond_to do |format|
      format.html { redirect_to ideas2020s_url, notice: 'Ideas2020 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ideas2020
      @ideas2020 = Ideas2020.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ideas2020_params
      params.require(:ideas2020).permit(:email, :name, :title)
    end
end
