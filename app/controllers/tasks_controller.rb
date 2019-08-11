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
  respond_to :js, :json, :html
  before_action :require_admin, only: [
      :edit, :update, :destroy, :new
  ]
  before_action :require_user
  # before_action :require_user
  def require_user
    if current_user
      true
    else
      redirect_to new_user_session_path, notice: "You must be logged in to access that page."
    end
  end
  def require_admin
    # return true if Rails.env.development?

    if !current_admin
      flash[:error] = "Visiting '#{request.fullpath}' requires an administrator account"
      redirect_to '/' and return
    end
  end
  def tasks_params
    params.require(:task).permit(:title, :title_en, :title_zh, :category_id, :test_file, :starter_file, :difficulty, :order, :created_at,
                                 :updated_at, :instruction, :description, :ppxmlfile)
  end
  def index
    @number = params[:number]
    puts('number: ', @number)
    @tasks = Task.all
    @categories = Category.order(name: :desc)
    @categorytasks = {}
    @minitasks = {}
    @minitask1 = {}
    @categories.each do |category|
      # if @task
        @categorytasks[category] = Task.where(category_id: category.id).order(order: :asc)
        @categorytasks[category].each do |task|
          @minitasks[task] = Minitask.where(task_id: task.id).order(order: :asc)
          @minitask1[task] = Minitask.where(task_id: task.id).order(order: :asc).first
        end
      # end
   end
  end
  def show
    @task = Task.find(params[:id])
    if @task.ppxmlfile
      gon.ppxmlfile_path = ppxmlfile_task_path
    else
      gon.ppxmlfile_path = nil
    end
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
          redirect_to action: "index",
                      notice: "Task #{@task.title} was successfully created."
        }
        format.json {
          render :index, status: :created, location: @task
        }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(tasks_params)
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


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html {
        redirect_to tasks_path,
                    notice: "#{@task.title} was successfully destroyed."
      }
      format.json { head :no_content }
    end
  end

  def test_file
    @task = Task.find(params[:id])
  end
  def snapbase
  end

  def correctscript
    # print
    @task = Task.find(params[:id])
    print(@task)
    @task.correctscript = params[:correctscript]
    print(@task.correctscript)
    respond_with @task.correctscript

  end

  def ppxmlfile
    @task = Task.find(params[:id])
    render plain: @task.ppxmlfile
  end
  def scriptarraytwo
    @task = Task.find(params[:id])
    if @task.ppxmlfile
      gon.ppxmlfile_path = ppxmlfile_task_path
    else
      gon.ppxmlfile_path = nil
    end
  end

  def scriptorder
    @task = Task.find(params[:id])
    # render layout: 'nonavbar'
  end


end



