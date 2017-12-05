Rails.application.routes.draw do
  root to: 'visitors#index'
  get 'character' => 'characters#show', as: 'character'
end
