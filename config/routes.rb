Rails.application.routes.draw do
  resources :sources
  root 'projects#index', as: 'projects_index'
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
