InstallRails::Application.routes.draw do

  resources :sessions, only: :destroy
  # resources :install_steps, path: 'steps'
  root 'welcome#index'

  resources :steps do
    resources :edges
  end

  get 'test', to: 'welcome#test'
  delete 'signout', to: 'sessions#destroy'

end
