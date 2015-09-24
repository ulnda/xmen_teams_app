class TeamsController < ApplicationController
  TEAM_CREATING_MESSAGE = "You've just created a new team."
  TEAM_REMOVING_MESSAGE = "You've just removed a team."
  TEAM_UPDATING_MESSAGE = "You've just updated a team."

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, flash: { alert: TEAM_CREATING_MESSAGE }
    else
      render 'new'
    end 
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path, flash: { alert: TEAM_UPDATING_MESSAGE }
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy!
    redirect_to teams_path, flash: { alert: TEAM_REMOVING_MESSAGE }
  end

  private
    def team_params
      params.require(:team).permit(:name, :description, mutant_ids: [])
    end
end
