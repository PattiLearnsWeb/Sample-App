Rails.application.routes.draw do
  get 'users/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

  resources :users do
    member do
      get :following, :followers
    end
  end

  get 'login'	=> 'sessions#new'
  post 'login' 	=> 'sessions#create'
  delete 'logout' 	=> 'sessions#destroy'

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
