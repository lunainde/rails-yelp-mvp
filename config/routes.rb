Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :new, :show, :create, :destroy] do
    resources :reviews, only: [:new, :create]
  end
end

#  rails-yelp-mvp git:(master) ✗ rails routes
#    Prefix Verb URI Pattern                       Controller#Action
#    restaurants GET    /restaurants(.:format)     restaurants#index
#                POST   /restaurants(.:format)     restaurants#create
# new_restaurant GET    /restaurants/new(.:format) restaurants#new
#     restaurant GET    /restaurants/:id(.:format) restaurants#show
#                DELETE /restaurants/:id(.:format) restaurants#destroy
#        reviews POST   /reviews(.:format)         reviews#create
#     new_review GET    /reviews/new(.:format)     reviews#new
