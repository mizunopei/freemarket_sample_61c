Rails.application.routes.draw do
  root "items#index"
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cards, only: [:new, :create]
  resources :addresses, only: [:new, :create, :update]

  resources :signups, only: [:index, :new, :create] do
    collection do
      get 'sms_confirmation'
      get 'complete'
    end
  end
 
  resources :users do
    collection do
      get 'logout'
      get 'profile'
      get 'personal'
      get 'card'
      get 'exhibit'
    end
  end

  resources :items do
    get 'pay_confirmation'
    get 'pay'
    get 'pay_complete'
    get 'delete_image'
  end

end
