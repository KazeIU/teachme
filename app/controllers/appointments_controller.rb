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
      redirect_to appointment_path(@appointment)
      flash[:notice]="appointment created!"
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

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to lessons_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_time, :location)
  end
end
