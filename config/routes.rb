Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchases, only:[:index, :create]
  end
end