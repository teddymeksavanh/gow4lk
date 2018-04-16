# config/routes.rb
Rails.application.routes.draw do
  resources :strolls do
    resources :places
  end
end
