class LessonPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == lesson.user
  end

  private

    def lesson
      record
    end
end
