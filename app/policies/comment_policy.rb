class CommentPolicy < ApplicationPolicy
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    true
  end

  def edit?
    user == comment.owner
  end

  def update? 
    edit?
  end

  def destroy?
    edit?
  end


end
