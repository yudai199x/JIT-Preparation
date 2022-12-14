Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  namespace :users do
    get 'dashboards/index'
    resources :articles
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
