require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'articles#index'
  get '/accounts/:id/unsubscribe' => 'accounts#unsubscribe', as: 'unsubscribe'
  patch '/accounts/:id/withdrawal' => 'accounts#withdrawal', as: 'withdrawal'

  namespace :administrator do
    resources :admins, only: [:index]
    resources :users, only: [:index]
    resources :articles, only: [:index]
  end

  resources :articles 

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  scope module: :apps do
    resources :favorites, only: [:index]
    resource :timeline, only: [:show]
    resource :profile, only: [:show, :edit, :update]
  end

  namespace :api, defaults: {format: :json} do
    scope '/articles/:article_id' do
      resources :comments, only: [:index, :create]
      resource :like, only: [:show, :create, :destroy]
    end
  end
end
