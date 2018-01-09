Rails.application.routes.draw do
  resources :schools, only: [:index, :show] do
    resources :finances, only: [:index]
    resources :admissions, only: [:index]
    resources :sport_teams, only: [:index]
    resources :enrollments, only: [:index]
    resources :veterans, only: [:index]
    resources :costs, only: [:index]
  end
end
