Rails.application.routes.draw do
  namespace :api do
    scope do
      post '/auth/sign_in', :to => 'user_token#create'
    end
    resources :posts do
      get :search, :on => :collection
    end
  end
end
