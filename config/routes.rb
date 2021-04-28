Rails.application.routes.draw do
  get 'developers/dashboard'
  get 'clients/dashboard'
  get '/developers/dashboard' => "developers#dashboard", :as => :developer_root
  get '/clients/dashboard' => "clients#dashboard", :as => :client_root
  get '/developers/client_details'
  devise_for :clients, controllers: { sessions: "clients/sessions", registrations: "clients/registrations" }
  devise_for :developers, controllers: { sessions: "developers/sessions", registrations: "developers/registrations" }
  
  resources :projects do
    resources :project_members
    resources :notes
  end
  root 'pages#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
