Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login', to: 'signups#login'
  get 'signup', to: 'signups#signup'
  get 'signup/registration', to: 'signups#registration'
  get 'signup/sms_confirmation', to: 'signups#sms_confirmation'
  get 'signup/address', to: 'signups#address'
  get 'signup/card', to: 'signups#card'
  get 'signup/complete', to: 'signups#complete'
  

root "items#index"
resources :items

end
