Rails.application.routes.draw do
  get 'developers/dashboard'
  get 'clients/dashboard'
  get '/developers/dashboard' => "developers#dashboard", :as => :developer_root
  get '/clients/dashboard' => "clients#dashboard", :as => :client_root
  devise_for :clients, controllers: { sessions: "clients/sessions" }
  devise_for :developers, controllers: { sessions: "developers/sessions" }
  resources :notes
  resources :projects
  root 'pages#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
