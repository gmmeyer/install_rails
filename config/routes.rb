InstallRails::Application.routes.draw do

  resources :sessions, only: :destroy
  # resources :install_steps, path: 'steps'
  root 'welcome#index'

  resources :steps
  resources :operating_systems

  get 'test', to: 'welcome#test'
  delete 'signout', to: 'sessions#destroy'

end
