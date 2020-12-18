Rails.application.routes.draw do
  resources :messages, only: %i[new index create]
  root to: 'messages#index'
  resources :admin_sessions, only: %i[new create]
  get 'admin/login', to: 'admin_sessions#new', as: 'login'
  post 'admin/logout', to: 'admin_sessions#destroy', as: 'logout'
  post 'admin/toggle_message_visiblity', to: 'admin_sessions#toggle_message_visiblity', as: 'toggle_message_visiblity'
end
