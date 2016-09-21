Rails.application.routes.draw do
  namespace :api do
    post '/auth/sign_in', :to => 'user_token#create'
    post 'upload', :to => 'upload#index'

    resources :posts do
      get :search, :on => :collection
    end
  end
end
