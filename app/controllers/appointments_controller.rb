class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @appointment.lesson = @lesson

    if @appointment.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def delete
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_time, :location)
  end
end
