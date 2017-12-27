Rails.application.routes.draw do
  resources :schools, only: [:index, :show]
end
