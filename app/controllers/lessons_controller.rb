class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    find_lesson
  end

  def new
    @user = User.find(params[:user_id])
    @lesson = Lesson.new
  end

  def create
    @user = User.find(params[:user_id])
    @lesson = Lesson.new(lesson_params)
    @lesson.user = @user

    if @lesson.save
      redirect_to user_lesson_path(@user)
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
