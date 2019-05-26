class TestscriptsController < ApplicationController
  respond_to :js, :json, :html

  # before_action :authenticate_user!
  #
  #
  def index
    @testscripts = Testscript.all
  end
  def new
    @task = Task.where({id: params[:task_id]}).first
    @testscript =  @task.build_testscript(params.permit(:scriptarray, :task_id))

  end
  def create
    @task = Task.where({id: params[:task_id]}).first
    @testscript = @task.create_testscript(params.permit(:scriptarray, :task_id))
    response.headers['Content-Type'] = 'application/json'

    if @testscript.save
      testfile = script2test(@testscript.scriptarray)
      @task.update_attributes(:test_file => testfile)
      # redirect_to :action => :index
      render json: {}, status: 200
    else
      flash.now[:notice] = "the script is not saved because you already have saved one before"
      render 'new'
    end


  end

  def show
    # @task = Task.where({id: params[:task_id]}).
    @testscript =  Testscript.where(task_id: params[:task_id]).first


  end

  def edit

  end

  def update
    @testscript =  Testscript.find(params[:task_id])
    # print(@testscript)
    if @testscript.update(testscript_params)
      redirect_to :action => :show
    else
      # @title = "Sign up":utf8, :authenticity_token, :commit, :scriptarray, :task_id):utf8, :authenticity_token, :commit, :scriptarray, :task_id)
      render 'new'
    end
  end
  def destroy

  end
  private
  def testscript_params
    print("------------params:-----------------------", params)
    params.fetch(:task, {}).permit!
    print('params.fetch------------:', params.fetch(:testscript, {}).permit!)
    # params
  end
  private
  def script2test(script)
    return script
  end







end















#   Below are the methods to be used if it's inputing testscripts!
#   def new
#     @task = Task.where({id: params[:task_id]}).first
#     @testscript =  @task.build_testscript(params.fetch(:testscript, {}).permit!)
#
#   end
#   def create
#     # @testscript = Testscript.new(params.fetch(:testscript, {}).permit!)
#     @task = Task.where({id: params[:task_id]}).first
#     @testscript = @task.create_testscript(params.fetch(:testscript, {}).permit!)
#     print(params[:scriptarray])
#
#
#     print("-----------------params[:scriptarray]:--------------- ", params.permit!)
#
#
#     if @testscript.save
#       print("------------testscript --------------------: ", @testscript.scriptarray)
#       redirect_to :action => :index
#     else
#       render 'new'
#     end
#
#   end