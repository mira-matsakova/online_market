class BuyerPolicy < ApplicationPolicy
  def edit?
    user.buyer? && user == record
  end

  def show?
    user.buyer? && user == record
  end
end
