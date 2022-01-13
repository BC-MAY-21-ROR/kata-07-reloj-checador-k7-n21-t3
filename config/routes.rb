Rails.application.routes.draw do
  get 'login/admin'
  root 'pages#home'
  get 'admin', to: 'dashboard_admin#dashboard_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
