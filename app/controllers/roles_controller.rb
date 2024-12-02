class RolesController < ApplicationController
  def new 
    @role = Role.new
    @actor = Actor.find(params[:actor_id])
    @role.actor = @actor
    @movies = Movie.all
  end

  def create 
    @role = Role.new(role_params)
    @actor = Actor.find(params[:actor_id])
    @role.actor = @actor

    if @role.save
      redirect_to actor_path(@role.actor), notice: 'Papel registrado com sucesso.'
    else
      @movies = Movie.all
      flash.now[:alert] = 'Papel não foi registrado.'
      render :new, status: :unprocessable_entity
    end
  end 
  private
  def role_params
    params.require(:role).permit(:movie_id, :actor_id, :name)
  end
end