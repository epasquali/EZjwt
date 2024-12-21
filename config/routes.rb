EzJwt::Engine.routes.draw do

  resource :user, only: [:destroy, :update]
  resources :users, only: [:index]

   post 'auth/login', to: 'authentication#login'

end
