Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  get '/reports/subjects', to: 'reports#subjects'

  root 'students#index'
end
