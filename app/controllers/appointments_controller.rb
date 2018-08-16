class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
    authorize @appointments
  end

  def show
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    authorize @appointment
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
  end

  def update
    @appointment.update(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to lessons_path
  end

  private

  def set_appointment
     @appointment = Appointment.find(params[:id])
     authorize @appointment
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :location)
  end
end
