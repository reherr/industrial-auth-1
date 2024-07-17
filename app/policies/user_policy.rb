class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def create?
    true
  end

  def edit?
    user == current_user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def show?
    user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end

  def feed?
    true
  end

  def discover?
    feed?
  end
end
