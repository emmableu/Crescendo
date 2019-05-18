class TasksController < ApplicationController
  # include DceLti
  #
  # # TODO: extract this.
  # require 'canvas-api'
  #
  # before_action :set_question, only: [
  #     :show, :edit, :update, :destroy,
  #     :starter_file, :submit_grade, :test_file
  # ]
  #
  # before_action :require_admin, only: [
  #     :edit, :update, :destroy, :new
  # ]
  def tasks_params
    params.require(:task).permit(:title, :category_id, :test_file, :starter_file, :difficulty, :order, :created_at,
                                 :updated_at, :instruction, :description)
  end
  def index
    @tasks = Task.all
    @categories = Category.all
    @categorytasks = {}
    @categories.each do |category|
      # if @task
        @categorytasks[category] = Task.where(category_id: category.id)
      # end
   end
  end
  def show
    # if @task.starter_file
    #   gon.starter_file_path = starter_file_question_path
    # else
    #   gon.starter_file_path = nil
    # end
    # gon.submissions_path = submission_question_path
    @task = Task.find(params[:id])
    render layout: 'base'

  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(tasks_params)

    respond_to do |format|
      if @task.save
        format.html {
          redirect_to @task,
                      notice: "Task #{@task.title} was successfully created."
        }
        format.json {
          render :show, status: :created, location: @task
        }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html {
          redirect_to @task,
                      notice: "Question #{@task.title} was successfully updated."
        }
        format.json {
          render :show, status: :ok, location: @task
        }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

end



