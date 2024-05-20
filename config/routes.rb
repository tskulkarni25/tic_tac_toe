Rails.application.routes.draw do
  root 'game#index'
  post 'game/move'
  delete 'game', to: 'game#destroy'
end
