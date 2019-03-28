Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: :welcome

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

end
