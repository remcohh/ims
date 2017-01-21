Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#index'

  get 'session/new'

  resources :categories
  resources :projects do
    resources :risk_registers
    get 'completed_list' => 'risk_registers#completed_list'
    get 'approved_list' => "risk_registers#approved_list"
    get 'approve_risk_register' => 'risk_registers#approve'
  end
  resources :risk_registers, only: [] do
    resources :risk_mitigations
    get 'update_status' => "risk_mitigations#update_status"
  end
  resources :users
  resources :designations
  
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'
  get 'mitigation_pending_list' => "risk_mitigations#pending_list"
  get 'mitigation_completed_list' => "risk_mitigations#completed_list"
  
  root 'dashboard#index'
end
