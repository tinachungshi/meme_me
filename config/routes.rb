Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'memes#index'
resources :users, only: [:new, :create]
resources :sessions, only: [:new, :create, :destroy]

get '/memes/all', to: 'memes#all'
get '/memes/filtered/:cat', to: 'memes#filtered', as: :filtered
get '/memes/random', to: 'memes#random'
resources :memes

get '/categories/:id', to: 'categories#show', as: :show_categories

get '/login', to: 'sessions#new'
get '/logout', to: 'sessions#destroy'


end
