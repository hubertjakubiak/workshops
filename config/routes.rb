Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  resources :teachers do 
    
  end

  get '/reports/subjects', to: 'reports#subjects'

  root 'students#index'
end
