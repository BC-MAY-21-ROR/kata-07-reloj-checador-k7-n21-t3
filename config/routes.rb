Rails.application.routes.draw do
  get 'avarage_time/month'
  get 'login/admin'
  root 'pages#home'
  get 'admin', to: 'dashboard_admin#dashboard_admin'
  get "/manage_employee", to: "manage_employee#table"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
