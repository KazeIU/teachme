Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:index, :show, :edit] do
    resources :lessons
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
