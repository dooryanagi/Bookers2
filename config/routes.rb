Rails.application.routes.draw do

  # ルートパスを設定
  root to: "homes#top"
  get 'home/about' => 'homes#about'

  devise_for :users

  resources :books, only:[:new, :show, :index, :create, :destroy, :edit, :update]

  resources :users, only:[:show, :index, :edit, :update]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
