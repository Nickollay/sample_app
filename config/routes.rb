Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'

  root 'tests#index'

  devise_for :users, path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'sessions/sessions' }


  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # delete :signout, to: 'sessions#destroy'
  #
  # resources :users, only: :create
  # resources :sessions, only: :create

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end



  resources :test_passages, only: %i[show update] do
    member do
      get :result
      # post :gist
      resources :gists, only: :create
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
  end
end
