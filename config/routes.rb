Rails.application.routes.draw do
  get 'login/admin'
  root 'pages#home'
  get 'admin', to: 'dashboard_admin#dashboard_admin'
  get "/manage_employee", to: "manage_employee#table"
  get "absence", to: 'absence#absence'
  get "/manage_company", to: "management_company#table"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
