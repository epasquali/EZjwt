EzJwt::Engine.routes.draw do

  resource :user, only: [:destroy, :update, :show]
  resources :users, only: [:index]

   post 'auth/login', to: 'authentication#login'

   post 'user/register', to: 'users#create', as: :new_user_registration

end
