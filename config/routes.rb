Rails.application.routes.draw do
  root 'landing#index'
  get '/admin' => 'showtimes#index'

  resources :receipts
  resources :auditoria
  resources :movies
  resources :showtimes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
