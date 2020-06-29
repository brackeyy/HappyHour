class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user
  end

  def create?
    user
  end

  def confirm?
    record.offer.bar.user.id == user.id
  end

end
