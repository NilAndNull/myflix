Myflix::Application.routes.draw do

  get 'home' => 'videos#index'
  
  resources :categories

  resources :videos do
    get 'search', on: :collection
  end

  get 'ui(/:action)', controller: 'ui'


end
