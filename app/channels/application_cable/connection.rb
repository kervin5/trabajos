module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = current_user
    end

    private

    def current_user
      token = request.params[:token].to_s
      decoded_json = Base64.decode64(token)

      decoded_hash = JSON.parse(decoded_json).symbolize_keys!

      user = User.find_by(email: decoded_hash[:uid])

      token = decoded_hash[:"access-token"]
      client_id = decoded_hash[:client]

      user && user.valid_token?(token, client_id) ? user : nil
    end
  end
end
