Rails.application.routes.draw do
  resources :doctors, only: [:show] do
    resources :patients, only: [:destroy]
  end
  resources :patients, only: [:index]
end
