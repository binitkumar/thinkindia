Rails.application.routes.draw do

  resources :gallery_pic_comments, only: [:create, :destroy]
  resources :gallery_pics do
    member do
      post :add_tag
      delete :remove_tag
    end
  end
  mount Ckeditor::Engine => '/ckeditor'
  resources :openings do
    resources :application_forms
  end
  resources :application_forms
  resources :news_and_events, controller: :press_releases
  resources :press_releases

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
    resources :gallery_pics, only: [:index] do
      member do
        put :mark_private
        put :publish
        put :unpublish
        put :remove_private
      end
    end

    resources :users do
      member do
        put "activation"
        put "update_is_admin"
      end
    end
  end

  resources :contacts
  resources :comments
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
  get 'home/subhas'
  get 'home/patel'
  get 'home/aurobindo'
  get 'privacy_policy', to: "home#privacy_policy", as: :privacy_policy
  get 'terms_and_conditions', to: "home#terms_and_conditions", as: :terms_and_conditions
  get 'about', to: "home#about", as: :about

  get "users/:id", to: "home#user_details"
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
