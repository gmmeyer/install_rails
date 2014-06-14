InstallRails::Application.routes.draw do

  resource :sessions
  # resources :install_steps, path: 'steps'
  root 'welcome#index'

  resources :steps do
    resources :edges
  end

  get 'test', to: 'welcome#test'
  get 'admin', to: 'welcome#admin'
  delete 'signout', to: 'sessions#destroy'

end
