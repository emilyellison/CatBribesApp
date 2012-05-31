CatBribesApp::Application.routes.draw do

  root to: 'catbribes#index'
  
  resources :catbribes, only: [ :index ]
  resources :members, only: [ :new, :create, :show ]

end
