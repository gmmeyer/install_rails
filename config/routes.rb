InstallRails::Application.routes.draw do

  resource :sessions
  # resources :install_steps, path: 'steps'
  root 'welcome#index'

  get 'admin', to: 'welcome#admin'
  post 'edges/:id/save-user-choice', to: 'edges#save_user_choice', as: "save_user_choice"

  resources :users

  resources :steps do
    resources :edges, except: [:update, :destroy]
  end

  resources :edges, only: [:update, :destroy]

  get 'test', to: 'welcome#test'
  delete 'signout', to: 'sessions#destroy'
  get 'images', to: 'welcome#images'

end
