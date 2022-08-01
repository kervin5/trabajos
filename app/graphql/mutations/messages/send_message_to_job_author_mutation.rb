module Mutations
  module Messages
    class SendMessageToJobAuthorMutation < Mutations::BaseMutation
      argument :job_id, ID, required: true
      argument :message, String, required: true
      field :message, String
      field :topic, String
      field :id, ID
      # field :job, Types::Jobs::JobType, null: true
      # field :errors, Types::ValidationErrorsType, null: true

      def resolve(job_id:, message:, topic: nil)
        job = Job.find(job_id)
        author = job.author
        sender = current_user
        topic =
          (
            if topic.present?
              topic
            else
              "#{sender.first_name} #{sender.last_name} - #{job.id}: #{job.title}"
            end
          )
        if sender.send_message(author, topic, message)
          TrabajosSchema.subscriptions.trigger(
            "messageSent",
            {},
            { status: "newMessage" + Time.now.to_s }
            # ,
            # scope: author.id
          )
          { message: message, topic: topic }
        else
          { errors: job.errors }
        end
      end

      def authorized?(args)
        authorize!(:job, :like?)
      end
    end
  end
end
