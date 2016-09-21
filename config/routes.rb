Rails.application.routes.draw do
  namespace :api do
    scope do
      post '/auth/sign_in', :to => 'user_token#create'
    end
    resources :posts
  end
end
