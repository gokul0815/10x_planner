Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts
  root "static_pages#home"
  get "home" => "static_pages#home"
end
