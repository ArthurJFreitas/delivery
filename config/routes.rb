Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :orders
    end
  end
end

#DB_PASSWORD=delivery2020