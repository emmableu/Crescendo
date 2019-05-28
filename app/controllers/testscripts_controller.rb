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
    @testscript =  @task.build_testscript(params.permit(:blockarray, :blockxmlarray, :scriptarray, :task_id))

  end
  def create
    @task = Task.where({id: params[:task_id]}).first
    @testscript = @task.create_testscript(params.permit(:blockarray, :blockxmlarray, :scriptarray, :task_id))
    response.headers['Content-Type'] = 'application/json'

    if @testscript.save
      scriptarray = (@testscript.scriptarray)
      @task.scriptarray = scriptarray
      @template = Template.where({template_name: 'spriteContainsBlock'}).first
      testtemplate = @template.test_template
      testfile = script2test(scriptarray, testtemplate)


      blockxmlarray = block2xml(@testscript.blockarray)
      @testscript.update_attributes(:blockxmlarray => blockxmlarray)
      xmltemplate = Template.where({template_name: 'xml'}).first.test_template
      ppxmlfile = script2test(blockxmlarray, xmltemplate)


      @task.update_attributes(:test_file => testfile)
      @task.update_attributes(:ppxmlfile => ppxmlfile)
      render json: {}, status: 200
    else
      flash.now[:notice] = "the script is not saved because you already have saved one before"
      render 'new'
    end
    # redirect_to edit_task_path
  end

  def show
    # @task = Task.where({id: params[:task_id]}).
    @testscript =  Testscript.where(task_id: params[:task_id]).first


  end

  def edit
    @task = Task.where({id: params[:id]}).first
  end

  def update
    @task = Task.where({id: params[:id]}).first
    @testscript =  Testscript.where({task_id: @task.id}).first
    if @testscript.update(testscript_params)
      redirect_to :action => :show
    else
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
  def script2test(scriptarray, testtemplate)
    file = testtemplate.sub('BLOCKSTOBEREPLACED', scriptarray)
    return file
  end
  def block2xml(blockarray)
    blockarray.sub!('[', '')
    blockarray.sub!(']', '')
    blockarray = blockarray.split(',')
    blockarray = blockarray.reject { |c| c.empty? }
    blockxmlarray = ""
    xvalue = 70
    yvalue = 40
    blockid = 42
    for i in 0..(blockarray.length-1) do
      xml = "<script x='XVALUE' y='YVALUE'><block id='BLOCKID' s=BLOCKNAME><l></l></block></script>"
      xml.sub!('XVALUE', xvalue.to_s)
      xml.sub!('YVALUE', yvalue.to_s)
      xml.sub!('BLOCKID', blockid.to_s)
      xml.sub!('BLOCKNAME', blockarray[i].to_s)
      blockxmlarray += xml
      yvalue += 30
      blockid += 1
    end
    puts 'blockxmlarray'
    puts blockxmlarray
    return blockxmlarray

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