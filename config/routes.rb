Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      root to: 'cars#index'
      get "/cars", to: 'cars#index'
      get "/cars/:id", to: 'cars#show'
      post "/cars", to: 'cars#create'
      patch "/cars/:id", to: 'cars#update'
      delete "/cars/:id", to: 'cars#destroy'
    end

    namespace :v2 do
      root to: 'cars#index'
      get "/cars", to: 'cars#index'
      get "/cars/:id", to: 'cars#show'
      post "/cars", to: 'cars#create'
      patch "/cars/:id", to: 'cars#update'
      delete "/cars/:id", to: 'cars#destroy'
    end
  end
end
