class Api::UserUpdatesController < ApplicationController
  def index
    @updates = UserUpdate.where("user_id = ? or level = 'all'", params[:id]).order(:created_at)

    if @updates.length > 0
      render json: @updates.collect{|update| 
        {
          id: update.id,
          message: update.message
        }
      }.to_json
    else
      render json: [{id: nil, message: "No updates available currently"}]
    end
  end
end
