Rails.application.routes.draw do
  devise_for :users
  # get 'items/index'
  root to: "items#index"
  resources :items do
    resources :purchases
    # purchasesはitemに結びつくためネスト
  end
end
