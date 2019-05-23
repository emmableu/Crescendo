class CategoriesController < ApplicationController
  
  # include DceLti
  #
  # # TODO: extract this.
  # require 'canvas-api'
  #
  # before_action :set_question, only: [
  #     :show, :edit, :update, :destroy,
  #     :starter_file, :submit_grade, :test_file
  # ]

  before_action :require_admin, only: [
      :edit, :update, :destroy, :new
  ]
  def require_admin
    # return true if Rails.env.development?

    if !current_admin
      flash[:error] = "Visiting '#{request.fullpath}' requires an administrator account"
      redirect_to '/' and return
    end
  end
    def category_params
      params.require(:category).permit(:name, :id, :tasks)
    end
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
      @tasks = Category.find(params[:id]).tasks
    end

    def new
      @category = Category.new()
    end

    def edit
      @category = Category.find(params[:id])
    end

    # POST /categories
    # POST /categories.json
    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html {
            redirect_to @category,
                        notice: "Category #{@category.name} was successfully created."
          }
          format.json {
            render :show, status: :created, location: @category
          }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end


    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html {
            redirect_to @category,
                        notice: "Question #{@category.name} was successfully updated."
          }
          format.json {
            render :show, status: :ok, location: @category
          }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      respond_to do |format|
        format.html {
          redirect_to categories_path,
                      notice: "#{@category.name} was successfully destroyed."
        }
        format.json { head :no_content }
      end
    end
  





end
