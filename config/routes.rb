Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :signups do
    collection do
      get 'login'
      get 'registration'
      get 'sms_confirmation'
      get 'address'
      get 'card'
      get 'complete'
    end
  end  
  
  resources :users do
    collection do
      get 'logout'
      get 'profile'
    end
  end
root "items#index"
resources :items

end
