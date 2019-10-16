Rails.application.routes.draw do

  resources :openings do
    resources :application_forms
  end
  resources :application_forms
  resources :press_releases
  mount Ckeditor::Engine => '/ckeditor'

  namespace :api do
    resources :users do
      collection do
        post "login"
        post "register"
        post "update"
      end
    end
    resources :contacts do
      collection do
        post "update"
      end
    end
    resources :press_releases
    resources :blogs
    resources :user_updates
  end

  namespace :admin do
    resources :users do
      member do
        put "activation"
        put "update_is_admin"
      end
    end
  end

  resources :contacts
  resources :posts do
    member do
      put :accept
      put :reject
    end
  end
  resources :blogs, only: :index
  mount Thredded::Engine => '/forum'

  devise_for :users, controllers: { registrations: "registrations" }
  get 'home/index'
  get 'privacy_policy', to: "home#privacy_policy", as: :privacy_policy
  get 'terms_and_conditions', to: "home#terms_and_conditions", as: :terms_and_conditions
  get 'about', to: "home#about", as: :about

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
