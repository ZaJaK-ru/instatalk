Rails.application.routes.draw do
  root to: 'rooms#index'

  resources :users, only: %i[new index destroy]
  resources :rooms, only: %i[create index show destroy], param: :token

  mount ActionCable.server => '/cable'
end
