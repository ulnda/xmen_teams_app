class TasksController < ApplicationController
  TASK_CREATING_MESSAGE = "You've just created a new task."
  TASK_REMOVING_MESSAGE = "You've just removed a task."
  TASK_UPDATING_MESSAGE = "You've just updated a task."

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, flash: { alert: TASK_CREATING_MESSAGE }
    else
      render 'new'
    end 
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, flash: { alert: TASK_UPDATING_MESSAGE }
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_to tasks_path, flash: { alert: TASK_REMOVING_MESSAGE }
  end

  private
    def task_params
      p = params.require(:task).permit(:title, :description, team_ids: [])
      p[:team_ids] ||= []
      p
    end
end
