class DiscoverController < ApplicationController

  def index
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["X-API-Key"] = Rails.application.credentials.movie_db[:key]
    end

    response = conn.get("/3/discover/movie")

    json = JSON.parse(response.body, symbolize_names: true)
    @top_20_movies = json[:results]
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email)
  end
end