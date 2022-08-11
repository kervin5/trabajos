module Mutations
  module Messages
    class SendMessageToJobAuthorMutation < Mutations::BaseMutation
      argument :job_id, ID, required: true
      argument :body, String, required: true
      field :message, Types::Messages::MessageType, null: true

      # field :errors, Types::ValidationErrorsType, null: true

      def resolve(job_id:, body:, topic: nil)
        job = Job.find(job_id)
        recipient = job.author
        sender = current_user
        topic = topic.presence || "#{job.id}: #{job.title}"
        result = sender.send_message(recipient, topic, body)

        if result
          TrabajosSchema.subscriptions.trigger(
            "messageSent",
            {},
            { status: "newMessage" + Time.now.to_s },
            scope: recipient.id
          )
          { message: result, topic: topic }
        else
          { errors: result.errors }
        end
      end

      #TODO: Update permission
      def authorized?(args)
        authorize!(:job, :like?)
      end
    end
  end
end
