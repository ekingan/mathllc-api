Rails.application.routes.draw do
  resources :clients do
    resources :jobs
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
