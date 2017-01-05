Rails.application.routes.draw do
  get 'course' => 'course#show'
  get 'course/setup'
  post 'course/set_org'
  get 'course/show_roster'
  get 'course/edit_roster'
  get 'course/change_roster'

  resources :users do
    member do
      post 'toggle_instructor_privilege'
    end
  end
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
