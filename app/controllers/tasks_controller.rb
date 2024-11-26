class TasksController < ApplicationController

  before_action :select_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    @task.save!

    redirect_to tasks_path
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def select_task
    @task = Task.find(params[:id])
  end
end
