class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1
  def show
    @quiz = Quiz.find(params[:id])
    @options = Option.where(quiz_id: @quiz.id).order(order: :asc)

  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
    @options = Option.where(quiz_id: @quiz.id).order(order: :asc)

  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
    @options = Option.where(quiz_id: @quiz.id).order(order: :asc)

  end

  # POST /quizzes
  def create
    @quiz = Quiz.new(quiz_params)
    @options = Option.where(quiz_id: @quiz.id).order(order: :asc)

    if @quiz.save
      redirect_to @quiz, notice: 'Quiz was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quizzes/1
  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  def options
    # @quiz = Quiz.find(params[:id])
    @options = Option.where(quiz_id: @quiz.id).order(order: :asc)
    return @options
  end

  # DELETE /quizzes/1
  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quiz_params
      params.require(:quiz).permit(:name, :quizbody, :solution, :minitask_id)
    end
end
