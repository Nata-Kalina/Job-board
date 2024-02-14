Rails.application.routes.draw do
  
  get 'about', to: 'pages#about'

  root to: 'pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
}
get '/users', to: 'users#registartion'
get '/u/:id', to: 'users#profile', as: 'user'

  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :jobs, only: [:create, :update, :destroy] 
      end
      resources :jobs, only: [:index, :show]
      resources :accounts do
        resources :applications 
      end
    end
  end
  
  delete "/companies/companyAndJobs/:id", to: "company#destroy_with_jobs", as: :destroy_with_jobs
  delete "/accounts/accountAndApplications/:id", to: "accounts#destroy_with_applications", as: :destroy_with_applications
end
