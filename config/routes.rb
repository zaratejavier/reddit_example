Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "subs#index"

  resources :subs do 
    resources :topics
end
  # get '/subs', to: 'sub#index'

  # get "/randomthing/:subs_id", to "subs#top_three"

 
end
