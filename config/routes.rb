Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'memes#index'

get '/profile', to: 'users#show'
get '/register', to: 'users#new'
resources :users, only: [:new, :show, :create, :edit, :update]

get '/memes/all', to: 'memes#all'
get '/memes/filtered/:cat', to: 'memes#filtered', as: :filtered
get '/memes/random', to: 'memes#random'
resources :memes

get '/login', to: 'sessions#new'
get '/logout', to: 'sessions#destroy'
resources :sessions, only: [:new, :create, :destroy]


end
