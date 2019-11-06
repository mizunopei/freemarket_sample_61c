Rails.application.routes.draw do
  devise_for :users

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


root "items#index"
resources :items

end
