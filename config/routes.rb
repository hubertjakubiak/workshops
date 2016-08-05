Rails.application.routes.draw do

  devise_for :users

  resources :students do
    get :subjects
  end

  resources :teachers do 
    
  end

  get '/reports/subjects', to: 'reports#subjects'

  root 'students#index'
end
