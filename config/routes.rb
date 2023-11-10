Rails.application.routes.draw do
  get 'tasks/active', to: 'tasks#active', as: :active_tasks
  get 'tasks/inactive', to: 'tasks#inactive', as: :inactive_tasks

  resources :tasks do
    member do
      post 'activate'
      post 'deactivate'
    end
  end

  # your other routes go here
  root 'tasks#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end