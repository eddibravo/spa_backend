Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins 'static.spafrontend.s3-website-us-east-1.amazonaws.com'
    else
      origins 'localhost:4000', '127.0.0.1:4000'
    end

    resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options]
  end
end