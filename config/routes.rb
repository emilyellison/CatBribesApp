CatBribesApp::Application.routes.draw do

  root to: 'catbribes#index'
  
  resources :catbribes, only: [ :index, :new, :create ]
  resources :members, except: [ :index, :destroy ]
  resources :sessions, only: [ :new, :create, ]
  resources :ratings, only: [ :create ]
  resources :cats, except: [ :index ]
  
  get 'sessions' => 'sessions#destroy'
  get 'neo' => 'static_pages#neo', as: :neo
  
end
