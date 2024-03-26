Rails.application.routes.draw do
  resources :topics
  root "articles#index"

  resources :articles do
    resources :comments
  end
end
