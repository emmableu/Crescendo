class DescriptionsController < ApplicationController
  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:task_id])
  end


  def create
    @task = Task.find(params[:task_id])
    @task.create_description(description_params)
    redirect_to new_task_path(@task)
  end

  def update
    @task.update_description(description_params)
    redirect_to edit_task_path(@task)
  end

  private
  def description_params
    params.require(:description).permit(:body)
  end
end
