Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy'

  root to: "home#show"

  get 'results', to: 'search#show', as: :results

  namespace :api do
    namespace :v1 do
      get 'coordinates', to: 'search#coordinates'

    end
  end

end
