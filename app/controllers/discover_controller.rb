class DiscoverController < ApplicationController

  def index
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["X-API-Key"] = Rails.application.credentials.movie_db[:key]
    end

    response = conn.get("/v3/member/#{@user.id}?limit=20")

    json = JSON.parse(response.body, symbolize_names: true)
    @top_20_movies = json[:members]
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email)
  end
end