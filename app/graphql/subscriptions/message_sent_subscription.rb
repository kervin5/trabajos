module Subscriptions
  class MessageSentSubscription < Subscriptions::BaseSubscription
    description "A comment was added to one of the viewer's posts"
    # For a given viewer, this will be triggered
    # whenever one of their posts gets a new comment

    # subscription_scope :current_user_id
    field :status, String
    # payload_type String

    # def subscribe
    #   # authorize, etc ...
    #   # Return the room in the initial response
    #   { status: "nothing" }
    # end

    # def update
    #   { status: "nel" }
    # end
  end
end
