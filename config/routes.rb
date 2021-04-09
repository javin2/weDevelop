Rails.application.routes.draw do
  devise_for :developers
  root 'pages#home'
  get 'notes/index'
  get 'notes/show'
  get 'notes/new'
  get 'notes/edit'
  get 'developers/index'
  get 'developers/show'
  get 'developers/new'
  get 'developers/edit'
  get 'clients/index'
  get 'clients/show'
  get 'clients/new'
  get 'clients/edit'
  get 'projects/index'
  get 'projects/show'
  get 'projects/new'
  get 'projects/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
