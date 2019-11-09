Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :signups, only: [:index, :new, :create] do
    collection do
      get 'login'
      get 'sms_confirmation'
      get 'complete'
    end
  end

  resources :addresses, only: [:new, :create, :update]  
  resources :cards, only: [:new, :create]  
  
  resources :users do
    collection do
      get 'logout'
      get 'profile'
      get 'personal'
    end
  end

root "items#index"
resources :items

end
