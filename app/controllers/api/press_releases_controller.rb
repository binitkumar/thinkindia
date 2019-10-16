class Api::PressReleasesController < ApplicationController

  def index
    @press_releases = PressRelease.order(:created_at)

    render json: @press_releases.collect{|release| 
      {
        id: release.id, 
        title: release.title, 
        short_message: ActionController::Base.helpers.strip_tags(release.article)[0..50],
        slug: release.slug
      }
    }.to_json
  end

  def show
    press_release = PressRelease.friendly.find(params[:id])

    if press_release
      render json: {
        status: "success",
        id: press_release.id, 
        title: press_release.title, 
        article: press_release.article,
        posted_on: press_release.created_at.strftime("%d/%m/%Y")
      }.to_json
    else
      render json: {
        status: "failure",
        message: "Record not found"
      }
    end
  end
end
