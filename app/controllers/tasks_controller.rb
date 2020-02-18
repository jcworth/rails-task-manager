class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(validate_params)
    @task.save
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    completed
    @task.update(validate_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end

  private

  def validate_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def completed
    @task.completed = true if @task[:completed] == true
    @task.save
  end
end
