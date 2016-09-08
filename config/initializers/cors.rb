Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins 'd4xebji6ytazw.cloudfront.net'
    else
      origins 'localhost:4000', '127.0.0.1:4000'
    end

    resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options]
  end
end