Rails.application.routes.draw do
  resources :clients do
    resources :jobs
  end
end
