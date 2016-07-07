Rails.application.routes.draw do
  resources :killmails

  root 'killmails#index'
end
