module GraphqlAuth
  def current_user
    context[:current_user].presence
  end

  def authenticate_user!
    return if context[:current_user]
    raise GraphQL::ExecutionError, "You are not authenticated"
  end

  def authorize!(class_key, action)
    #TODO: update to support namespaced classes
    authenticate_user!
    class_constant = class_key.to_s.camelize.constantize
    # class_key.is_a? Array ? class_key.m : class_key.to_s.camelize.constantize
    id_key = (class_key.to_s + "_id").to_sym

    pundit_obj_arg =
      if self.arguments.key?(id_key)
        class_constant.find(self.arguments[id_key])
      else
        class_constant
      end

    begin
      context[:pundit].authorize pundit_obj_arg, action
    rescue StandardError
      raise GraphQL::ExecutionError,
            "You are not allowed to #{action.to_s.sub("?", "")} #{self.arguments.key?(id_key) ? "this" : "a"} #{object.class.name}"
    end
  end

  def policy_scope(items)
    context[:pundit].policy_scope(items)
  end
end
