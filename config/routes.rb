Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schedules
  resources :jobs
  resources :boats
  devise_for :users
  devise_scope :user do
    get "/signout" => "devise/sessions#destroy"
    unauthenticated do
      root :to => 'devise/sessions#new'
    end
    authenticated do
      root :to => 'boats#index'
    end
  end
  

 
end