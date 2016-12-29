Rails.application.routes.draw do
  get 'dashboard/index'

  get 'session/new'

  resources :risk_mitigations
  resources :risk_registers
  resources :categories
  resources :users
  resources :projects
  resources :designations
  
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'

  root 'dashboard#index'
end
