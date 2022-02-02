Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/login'   => 'devise/sessions#new'
    get 'users/logout'  => 'devise/sessions#destroy'
    get 'users/signin'  => 'devise/registrations#new'
    get '/user' => "devise/sessions#dashboard", :as => :user_root
  end

  get 'attendances/index'
  get 'avarage_time/month'
  get 'login/admin'
  root 'attendances#new'
  get 'admin', to: 'dashboard_admin#dashboard_admin'
  resources :employees, only: [:edit, :update, :index, :destroy, :new, :create]
  get "absence", to: 'absence#absence'
  resources :attendances, only: [:update, :index, :new, :create]
  resources :companies, only: [:edit, :update, :index, :destroy, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
