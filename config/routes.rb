Rails.application.routes.draw do
  root to: 'home#angular'
  get '/qualifications', to: 'qualifications#index'
end
