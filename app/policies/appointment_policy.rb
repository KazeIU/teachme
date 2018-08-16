class AppointmentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present?
  end

  def create?
    true
  end

  def update?
    return true if user.present? && user == appointment.user
  end

  def destroy?
    return true if user.present? && user == appointment.user
  end

  private

    def appointment
      record
    end
end

