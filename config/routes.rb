Rails.application.routes.draw do
  get 'attendances/index'
  get 'avarage_time/month'
  get 'login/admin'
  root 'attendances#new'
  get 'admin', to: 'dashboard_admin#dashboard_admin'
  get "/employees", to: "employees#index"
  get "absence", to: 'absence#absence'
  get "/companies", to: "companies#index"
  resources :attendances, only: [:update, :index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
