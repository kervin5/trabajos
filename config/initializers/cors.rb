Rails.application.config.middleware.insert_before 0, Rack::Cors do
  #TODO: Configure cors to only allow specific domains
  allow do
    origins "*"
    resource "*", headers: :any, methods: :any
  end
end
