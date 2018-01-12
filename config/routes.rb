Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :job_stages
  resources :stages
  resources :applications
  resources :candidates
  resources :jobs
  resources :users
  resources :companies
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
end
