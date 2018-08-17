class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    unless params[:query]
      @lessons = Lesson.all
    else
      @lessons = Lesson.search_by_location_and_language(params[:query])
    end
    authorize @lessons
  end

  def show
    find_lesson
    @markers = [{
        lat: @lesson.latitude,
        lng: @lesson.longitude#,
        # infoWindow: { content: render_to_string(partial: "/lessons/map_box", locals: { lesson: lesson }) }
    }]
  end

  def new
    @lesson = Lesson.new
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    authorize @lesson

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
    authorize @lesson
  end

  def lesson_params
    params.require(:lesson).permit(:language, :level, :description, :duration, :price)
  end
end

