class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end
  def update?
    # Only article owner can update it
    record.user == user
  end
  def create?
    # Any logged in user can create a article
    !user.nil?
  end

  def destroy?
    # Only article owner can destroy it
    update? # Same as: record.user == user
  end

end
