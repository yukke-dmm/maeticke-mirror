Rails.application.routes.draw do

  # これが論理削除の下にあるとログアウトで論理削除されてしまう。
  devise_for :users

  devise_for :owners, controllers:{
    sessions: 'owner/sessions',
    registrations: 'owner/registrations'
  }
  devise_for :admins, controllers:{
    sessions: 'admin/sessions'
  }


  namespace :owner do
    get 'homes/top'
    get 'homes/about'
    # quitをresourcesの後に置くとリンクがうまくいかない。
    get 'owners/quit'
    resources :owners, only:[:index,:edit,:show,:update,:destroy]
    resources :products
    resources :genres, only:[:index,:edit,:create,:update,:destroy]
  end


  namespace :admin do
    get 'homes/top'
    resources :categories, only:[:index,:edit,:create,:update,:destroy]
    resources :users,only:[:index,:edit,:show,:update,:destroy]
    resources :owners, only:[:index,:edit,:show,:update,:destroy]
  end


# ここからユーザー関連
  resources :products, only:[:index,:show]
  resources :owners, only:[:index,:show]
  resources :cart_items,only:[:index,:create,:update,:destroy]
  resources :orders, only:[:new,:index,:create]
  get 'orders/fin'
  resources :order_details, only:[:index,:show,:update]
  get 'users/quit'
  resources :users, only:[:destroy]

  delete 'cart_items_destroy_all' => 'cart_items#destroy_all'



# トップページ
  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'
  root 'homes#top'



# 新規登録関連

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
