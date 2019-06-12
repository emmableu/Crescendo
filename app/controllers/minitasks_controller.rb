class MinitasksController < ApplicationController
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

  def index
    @tasks = Task.all
    @categories = Category.order(name: :desc)
    @categorytasks = {}
    @minitasks = {}
    @minitask1 = {}
    @categories.each do |category|
      # if @task
      @categorytasks[category] = Task.where(category_id: category.id)
      @categorytasks[category].each do |task|
        @minitasks[task] = Minitask.where(task_id: task.id).order(order: :asc)
        @minitask1[task] = Minitask.where(task_id: task.id).order(order: :asc)[0]
      end
      # end
    end
  end

  def require_admin
    # return true if Rails.env.development?

    if !current_admin
      flash[:error] = "Visiting '#{request.fullpath}' requires an administrator account"
      redirect_to '/' and return
    end
  end
  def minitasks_params
    params.require(:minitask).permit(:id, :title,:task_id, :category_id, :test_file, :starter_file, :difficulty, :order, :created_at,
                                     :updated_at, :instruction, :description, :ppxmlfile, :allow_repeat, :palette_start_index)
  end

  def show

    @minitask = Minitask.find(params[:id])
    @quiz = Quiz.where(minitask_id: @minitask.id).first
    # print("quizbody: ", @quiz.quizbody);
    if @quiz
      @options =Option.where(quiz_id: @quiz.id).order(order: :asc)
    end
    @task = Task.where(id: @minitask.task_id).first
    # if @minitask.starter_file
    #   gon.starter_file_path = starter_file_minitask_path
    # else
    #   gon.starter_file_path = nil
    # end
    if @minitask.ppxmlfile
      gon.ppxmlfile_path = ppxmlfile_minitask_path
    else
      gon.ppxmlfile_path = nil
    end
    #
    puts('task: ', @task.title)
    if @minitask.order < 3
      @nextminitask = Minitask.where(task_id: @task.id, order: @minitask.order+1).first
      puts("nextminitask: ", @nextminitask)
    else
      @nextminitask = @minitask
    end

    render layout: 'base'

  end

  def new
    @minitask = Minitask.new
  end

  def edit
    @minitask = Minitask.find(params[:id])
  end

  def create
    @minitask = Minitask.new(minitasks_params)

    respond_to do |format|
      if @minitask.save
        format.html {
          redirect_to action: "index",
                      notice: "Minitask #{@minitask.title} was successfully created."
        }
        format.json {
          render :index, status: :created, location: @minitask
        }
      else
        format.html { render :new }
        format.json { render json: @minitask.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @minitask = Minitask.find(params[:id])
    respond_to do |format|
      if @minitask.update(minitasks_params)
        format.html {
          redirect_to @minitask,
                      notice: "Question #{@minitask.title} was successfully updated."
        }
        format.json {
          render :show, status: :ok, location: @minitask
        }
      else
        format.html { render :edit }
        format.json { render json: @minitask.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @minitask = Minitask.find(params[:id])
    @minitask.destroy
    respond_to do |format|
      format.html {
        redirect_to minitasks_path,
                    notice: "#{@minitask.title} was successfully destroyed."
      }
      format.json { head :no_content }
    end
  end

  def test_file
    @minitask = Minitask.find(params[:id])
  end
  def snapbase
  end

  def correctscript
    # print
    @minitask = Minitask.find(params[:id])
    print(@minitask)
    @minitask.correctscript = params[:correctscript]
    print(@minitask.correctscript)
    respond_with @minitask.correctscript

  end

  def ppxmlfile
    @minitask = Minitask.find(params[:id])
    render plain: @minitask.ppxmlfile
  end
  def starter_file
    @minitask = Minitask.find(params[:id])
    render plain: @minitask.starter_file

  end


  def next_minitask
    @minitask = Minitask.find(params[:id])
    @task = Task.where(id: @minitask.task_id).first
    @nextminitask = Minitask.where(task_id: @task.id, order: @minitask.order+1).first
    # respond_with @nextminitask.show
    format.html {
      redirect_to action: "show",
                  id: @nextminitask.id

    }
  end



  # def scriptarraytwo
  #   @minitask = Minitask.find(params[:id])
  #   if @minitask.ppxmlfile
  #     gon.ppxmlfile_path = ppxmlfile_minitask_path
  #   else
  #     gon.ppxmlfile_path = nil
  #   end
  # end

  def scriptorder
    @minitask = Minitask.find(params[:id])
    # render layout: 'nonavbar'
  end

end
