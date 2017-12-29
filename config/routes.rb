Rails.application.routes.draw do
  resources :schools, only: [:index, :show] do
    resources :finances, only: [:index]
  end
end
