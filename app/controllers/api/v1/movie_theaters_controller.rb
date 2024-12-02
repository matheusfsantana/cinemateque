class Api::V1:MovieTheatersController < ActionController::API 
  def show
    movie_theater = MovieTheater.where(params[:id]).include(:rooms)

    p movie_theater
  end
end