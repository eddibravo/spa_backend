Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:4000', '127.0.0.1:4000'
    resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options]
  end
end