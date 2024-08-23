class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["X-API-Key"] = Rails.application.credentials.movie_db[:key]
    end

    response = conn.get("/3/discover/movie")

    json = JSON.parse(response.body, symbolize_names: true)
    @top_20_movies = json[:results]
  end
end