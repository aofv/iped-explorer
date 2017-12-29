Rails.application.routes.draw do
  resources :schools, only: [:index, :show] do
    resources :finances, only: [:index]
    resources :admissions, only: [:index]
    resources :sport_teams, only: [:index]
  end
end
