class FollowRequestPolicy < ApplicationPolicy
  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def create?
    true
  end

  def update?
    user == @follow_request.sender || user == @follow_request.recipient
  end

  def destroy?
    update?
  end

end
