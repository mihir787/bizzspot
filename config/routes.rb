Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy'

  root to: "home#show"

  post 'search', to: 'search#search'
  get 'results/', to: 'search#show', as: :result

  namespace :api do
    namespace :v1 do
      # get 'coordinates/:address', to: 'search#coordinates', address: /.*/
      get 'coordinates', to: 'search#coordinates'

    end
  end

end
