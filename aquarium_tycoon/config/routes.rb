Rails.application.routes.draw do
  resources :feeding_logs
  resources :event_registrations
  resources :members
  resources :treatment_logs
  resources :events
  resources :employees
  resources :tanks
  resources :habitats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals

  root 'application#hello'
end
