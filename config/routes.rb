Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :restaurants do
    collection do
      get :owner
    end
  end
end
