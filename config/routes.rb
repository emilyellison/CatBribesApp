CatBribesApp::Application.routes.draw do

  root to: 'catbribes#index'
  
  resources :catbribes, except: [ :destroy ]
  resources :members, except: [ :index, :destroy ]
  resources :sessions, only: [ :new, :create, ]
  resources :ratings, only: [ :create ]
  resources :cats, except: [ :index ]
  resources :cat_members, only: [ :new, :create ]
  
  get 'sessions' => 'sessions#destroy'
  get 'neo' => 'static_pages#neo', as: :neo
  
end
