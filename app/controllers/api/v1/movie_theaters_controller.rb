class Api::V1::MovieTheatersController < ActionController::API 
  def show
    movie_theater = MovieTheater.where(params[:id])
    movie_theater_details = movie_thear.as_json(
      only: [:id, :name]
    )
    render json: {}, status: :ok
  end
end