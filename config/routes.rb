Rails.application.routes.draw do

  namespace :owners do
    get 'homes/top'
    get 'homes/about'
  end

  namespace :admins do
    get 'homes/top'
  end

  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'
  root 'homes#top'

  devise_for :owners, controllers:{
    sessions: 'owners/sessions',
    registrations: 'owners/registrations'
  }
  devise_for :admins, controllers:{
  	sessions: 'admins/sessions'
  }

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
