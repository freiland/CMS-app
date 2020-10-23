Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  root to: 'projects#index' 
  
  resources :projects
  
  resources :posts do 
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
