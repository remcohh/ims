Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#index'

  get 'session/new'

  resources :categories
  resources :projects do
    resources :risk_registers
    get 'completed_list' => 'risk_registers#completed_list'
    get 'approved_list' => "risk_registers#approved_list"
  end
  resources :risk_registers, only: [] do
    resources :risk_mitigations    
  end
  resources :users
  resources :designations
  
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'
  get 'get_risks' => "risk_mitigations#get_risks"
  get 'update_status' => "risk_mitigations#update_status"
  
  root 'dashboard#index'
end
