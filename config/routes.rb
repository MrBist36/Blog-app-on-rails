Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: "users/registrations", 
    sessions: "users/sessions"
  }
  resource :profile, only: [:new , :create, :show, :edit]
  
  root "home#index"

  get "org_articles", to: "articles#fetch_org_articles"
  resources :articles do
    resources :comments
  end
end
