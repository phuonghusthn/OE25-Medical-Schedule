Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#about"

    get "/signup", to: "patients#new"
    get "/signin", to: "sessions#new"
    post "/signin", to: "sessions#create"
    delete "/signout", to: "sessions#destroy"

    resources :patients do
      resources :medical_records
    end
    resources :doctors do
      resources :comments
      resources :schedules
    end
    resources :staffs
    resources :appointments
    resources :account_activations, only: :edit
  end
end
