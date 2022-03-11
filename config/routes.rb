Rails.application.routes.draw do
  get 'welcome/index'

  namespace :admins do
    get 'dashboard/index'
  end

  devise_for :admins, path: 'admins', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :users, path: 'users', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
