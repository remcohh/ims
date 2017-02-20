Rails.application.routes.draw do

  get 'dashboard' => 'dashboard#index'
  get 'show_risk' => 'dashboard#show_risk'
  get 'critical_risks' => 'dashboard#critical_risks'
  get 'off_target_risks' => 'dashboard#off_target_risks'
  get 'report' => 'dashboard#report'
  post 'advance_search' => 'searches#advance_search'

  resources :searches, only: [:new]
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
