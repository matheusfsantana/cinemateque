class ActorsController < ApplicationController
  def index 
    @actors = Actor.all
  end

  def new 
    @actor = Actor.new
  end

  def create 
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to actors_path, notice: 'Ator registrado com sucesso.'
    else
      flash.now[:alert] = 'Ator não foi registrado.'
      render :new, status: :unprocessable_entity
    end
  end 

  def show 
    @actor = Actor.find(params[:id])
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :birth_date, :nacionality)
  end
end