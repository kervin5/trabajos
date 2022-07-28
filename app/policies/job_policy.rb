class JobPolicy < ApplicationPolicy
  # only if user is the owner of the job
  def update?
    user.present? && record.author == user
  end

  def create?
    user.present? && (user.is_admin? || user.is_employer?)
  end

  class Scope < Scope
    def resolve
      puts self.methods.inspect
      user.present? && user.is_admin? ?
        scope :
        if user.present? && user.is_employer?
          scope.where(author_id: user.id)
        else
          scope.where(status: "published")
        end
    end
  end
end
