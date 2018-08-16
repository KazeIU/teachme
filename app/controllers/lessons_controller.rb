class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].empty?
      @lessons = Lesson.all
    else
      @lessons = Lesson.search_by_location_and_language(params[:query])
    end
  end

  def show
    find_lesson
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user

    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def edit
    find_lesson
  end

  def update
    find_lesson
    @lesson = Lesson.update(lesson_params)
    if @lesson.save
      redirect_to user_lesson_path(@user)
    else
      render :new
    end
  end

  private
  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:language, :level, :description, :duration, :price)
  end
end

