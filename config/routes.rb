Rails.application.routes.draw do
  get 'attendances/index'
  get 'avarage_time/month'
  get 'login/admin'
  root 'pages#home'
  get 'admin', to: 'dashboard_admin#dashboard_admin'
  resources :employees, only: [:edit, :update, :index, :destroy, :new, :create]
  get "absence", to: 'absence#absence'
  resources :companies, only: [:edit, :update, :index, :destroy, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
