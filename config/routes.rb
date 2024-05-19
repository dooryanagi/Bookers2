Rails.application.routes.draw do

  resources :books, only:[:new, :show, :index, :create, :destroy, :edit, :update]


  # ルートパスを設定
  root to: "homes#top"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
