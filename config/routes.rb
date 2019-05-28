Rails.application.routes.draw do

  # devise_for :admins
  # devise_for :users
  resources :categories, :tasks, :templates
  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: 'users/registrations'}
  # devise_for :admins, controllers: { sessions: 'admins/sessions' , registrations: 'admins/registrations'}
  devise_for :admins do
    get 'sign_up', to: 'admins/registrations#new'
    get 'sign_in', to:'admins/sessions#new'
  end

  get 'admin_dashboard', to: 'users#index', :as => :users
  get 'admin_dashboard/users/:id', :to => 'users#show', :as => :user
  delete 'admin_dashboard/users/:id', :to => 'users#destroy'

  # get 'snap_base', to: 's'
  # TODO: Better Homepage at some point.
  root :to => "tasks#index"
  # rails_admin.dashboard_path :to =>

  resources :tasks do
    resources :descriptions
    resources :testscripts
      # match "input_new " => "input_new", :as => 'another_new'
    # end
    member do
      # TODO: Figure out if a submissions controller might be better...
      post 'submission', to: 'tasks#submit_grade'
      get 'starter_file', to: 'tasks#starter_file'
      get 'test_file', to: 'tasks#test_file'
      # get 'snapbase', to: 'tasks#snapbase'
      get 'correctscript', to: 'tasks#correctscript'
      get 'scriptarraytwo', to: 'tasks#scriptarraytwo'
      get 'ppxmlfile', to: 'tasks#ppxmlfile'
      get 'scriptorder', to: 'tasks#scriptorder'


    end
  end


  resources :questions do
    member do
      # TODO: Figure out if a submissions controller might be better...
      post 'submission', to: 'questions#submit_grade'
      get 'starter-file', to: 'questions#starter_file'
      get 'test-file', to: 'questions#test_file'
    end
  end

  # Oauth Account URLs
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # mount DceLti::Engine, at: '/lti'
  scope '/lti',  module: 'dce_lti' do
    resources :sessions, only: [:create] do
      collection do
        get :invalid
      end
    end

    resources :configs, only: [:index]
  end

  resources :courses

  # Admin Tools
  scope '/admin' do
    mount Blazer::Engine, at: "analyze"
    mount PgHero::Engine, at: "pghero"
    get 'users', to: 'dashboards#users', as: 'users_dashboard'
  end

  # Public Redirects
  get 'snap', to: 'welcome#snap'
end
