Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
}

  namespace :api do
    namespace :v1 do
      resources :accounts do
        resources :applications
        resources :companies do
         resources :jobs, only: [:create, :update, :destroy] 
        end
        resources :jobs, only: [:index, :show]
      end 
    end
  end
  

end
