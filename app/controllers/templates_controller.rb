class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def new
    @template = Template.new()
  end

  def edit
    @template = Template.find(params[:id])
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html {
          redirect_to @template,
                      notice: "Template #{@template.template_name} was successfully created."
        }
        format.json {
          render :show, status: :created, location: @template
        }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @template = Template.find(params[:id])
    respond_to do |format|
      if @template.update(template_params)
        format.html {
          redirect_to @template,
                      notice: "Question #{@template.template_name} was successfully updated."
        }
        format.json {
          render :show, status: :ok, location: @template
        }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    respond_to do |format|
      format.html {
        redirect_to templates_path,
                    notice: "#{@template.template_name} was successfully destroyed."
      }
      format.json { head :no_content }
    end
  end

  private
  def template_params
    # print("------------params:-----------------------", params)
    params.fetch(:template, {}).permit!
    # print('params.fetch------------:', params.fetch(:testscript, {}).permit!)
    # params
  end

end
