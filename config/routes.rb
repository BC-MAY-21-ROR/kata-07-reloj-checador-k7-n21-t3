Rails.application.routes.draw do
  get 'login/admin'
  root 'pages#home'
  get 'admin', to: 'dashboard_admin#dashboard_admin'
  get "/manage_employee", to: "manage_employee#table"
  get "absence", to: 'absence#absence' 
end
