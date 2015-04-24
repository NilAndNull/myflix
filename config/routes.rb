Myflix::Application.routes.draw do

  root 'pages#front'

  resources :users, only: [:new, :create]
  resources :categories
  resources :videos do
    get 'search', on: :collection
  end

  get 'ui(/:action)', controller: 'ui'

  get    'login',    to: 'sessions#new'
  post   'login',    to: 'sessions#create'
  delete 'logout',   to: 'sessions#destroy'
  get    'register', to: 'users#new' 
end
