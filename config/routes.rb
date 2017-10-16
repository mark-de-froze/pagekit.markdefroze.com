Rails.application.routes.draw do

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

      namespace :portfolio do
        get '/', to: 'projects#index'
        resources :projects
        resources :images
        resources :feedbacks
        resources :categories
        resources :articles
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
    end
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }, path: 'admin', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
  }

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
