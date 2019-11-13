Rails.application.routes.draw do
  root "items#index"
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
  
  resources :users do
    collection do
      get 'logout'
      get 'profile'
      get 'personal'
      get 'card'
    end
  end

  resources :cards, only: [:new, :create]

  resources :items do
    get 'pay_confirmation'
    get 'pay'
    get 'pay_complete'
  end

end
