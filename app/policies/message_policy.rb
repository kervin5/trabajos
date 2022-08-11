class MessagePolicy < ApplicationPolicy
  # only if user is the owner of the job
  def read?
    user.present? && record.received_messageable_id == user.id
  end

  #   class Scope < Scope
  #     def resolve
  #       user.present? && user.is_admin? ?
  #         scope :
  #         if user.present? && user.is_employer?
  #           scope.where(author_id: user.id)
  #         else
  #           scope.where(status: "published")
  #         end
  #     end
  #   end
end
