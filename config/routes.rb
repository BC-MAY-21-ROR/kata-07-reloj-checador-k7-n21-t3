Rails.application.routes.draw do
  root 'pages#home'
  get "/Manage-employee", to ""
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
