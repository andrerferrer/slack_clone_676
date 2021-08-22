Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: :show do
    resources :messages, only: :create 
    # this route must be nested because a message is created for ONE given chatroom
  end
end

# 7 PATHS
# C - 2
  # NEW AND CREATE
# R - 2
  # SHOW (1) AND INDEX (MANY)
# U - 2
  # EDIT AND UPDATE
# D - 1
  # DESTROY

