Rails.application.routes.draw do
  devise_for :models
  resources :items do
    get :upvote,    on: :member
    get :expensive, on: :collection
  end
end
