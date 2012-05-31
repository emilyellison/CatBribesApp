CatBribesApp::Application.routes.draw do

  root to: 'catbribes#index'
  
  resources :catbribes, only: [ :index, :new, :create ]
  resources :members, only: [ :new, :create, :show ]
  resources :sessions, only: [ :new, :create, ]
  
  get 'sessions' => 'sessions#destroy'
  
end
