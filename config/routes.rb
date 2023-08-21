Rails.application.routes.draw do
  root "user#index"
  get "user/edit_email", to: "user#edit_email"
  put "user/update_email", to: "user#update_email"
  get "user/edit_password", to: "user#edit_password"
  put "user/update_password", to: "user#update_password"
  get "user/detail", to: "user#detail"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
  end

end
