Rails.application.routes.draw do

  scope module: :application do
    scope module: :blog do
      get '/blog', to: 'posts#index'
      get '/blog/:id', to: 'posts#show'
    end
  end

  scope '/admin' do
    scope module: :admin do
      get 'dashboard', to: 'dashboard#index'

      namespace :users do
        get '/', to: 'accounts#index'
        resources :accounts
        resources :roles
        resources :keys
      end

      namespace :site do
        get '/', to: 'pages#index'
        resources :pages
        resources :widgets
        resources :links
        resources :files, path: 'storage'
        resources :mails
        resources :settings
      end

      namespace :blog do
        get '/', to: 'posts#index'
        resources :posts
        resources :comments
      end

      namespace :portfolio do
        get '/', to: 'projects#index'
        resources :projects
        resources :images
        resources :feedbacks
        resources :categories
        resources :articles
      end

      namespace :shop do
        get '/', to: 'products#index'
        resources :products
        resources :categories
        resources :orders
        resources :details
      end
    end
  end

  namespace :api, defaults: {format: 'json'} do
    api_version(:module => 'V1', :path => {:value => 'v1'}) do
      namespace :site do
        resources :pages
        resources :widgets
        resources :links
        resources :files, path: 'storage'
        resources :mails
        resources :settings
      end

      namespace :portfolio do
        resources :projects
        resources :images
        resources :feedbacks
        resources :categories
        resources :articles
      end

      namespace :blog do
        resources :posts
        resources :comments
      end

      namespace :shop do
        resources :products
        resources :categories
        resources :orders
      end
    end
  end

  #devise_for :users, controllers: { sessions: 'users/sessions' }, path: 'admin', path_names: {
  #    sign_in: 'login',
  #    sign_out: 'logout',
  #}

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
