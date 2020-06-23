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

  # might not be necessary if offer expires automatically after i.e. 1h
  def update?
    record.offer.user == user
  end

end
