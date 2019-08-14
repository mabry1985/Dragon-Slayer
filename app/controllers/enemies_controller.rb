class EnemiesController < ApplicationController

  def index
    @enemy = Enemy.new
    render :new
  end

  def create
    @enemy = Enemy.new(enemy_params)
    binding.pry
    if @enemy.save
      flash[:notice] = "Enemy Created"
      redirect_to user_enemies_path(current_user)
    else
      render :new
    end
  end

  def show
    @enemy = Enemy.find(params[:id])
    render :show
  end


  private
  def enemy_params
    params.require(:enemy).permit(:name, :strength, :speed, :health, :gold, :xp)
  end
end
