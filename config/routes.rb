Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#index'

  get 'session/new'

  resources :risk_mitigations
  resources :categories
  resources :projects do
    resources :risk_registers
  end
  resources :users
  resources :designations
  
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'

  root 'dashboard#index'
end
