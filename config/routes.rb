Rails.application.routes.draw do

  get 'payments/new'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :students do
    get :subjects
  end

  resources :payments

  resources :teachers do 
    get :subjects
  end

  get '/reports/subjects', to: 'reports#subjects'
  get '/report/subjects', to: 'reports#subjects', as: 'report_subjects'
  get '/visitors', to: 'visitors#index'

  root 'students#index'
end
