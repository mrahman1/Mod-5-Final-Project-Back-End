Rails.application.routes.draw do
  resources :job_stages
  resources :stages
  resources :applications
  resources :candidates
  resources :jobs
  resources :users
  resources :companies
  resources :auth
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
