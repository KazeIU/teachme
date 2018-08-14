Rails.application.routes.draw do
  root to: 'lessons#index'
  devise_for :users
  resources :users, only: [:show]
  resources :lessons do
    resources :appointments, shallow: true
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
