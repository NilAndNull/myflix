Myflix::Application.routes.draw do

  get 'home' => 'videos#index'
  
  resources :categories
  resources :videos

  get 'ui(/:action)', controller: 'ui'


end
