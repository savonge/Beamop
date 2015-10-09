Rails.application.routes.draw do
  devise_for :users
  resources :pages do
    member do
      post 'publish'
    end
  end

  get 'publications/:genurl' => 'pages#show_public_page', as: 'public'
  root 'pages#new'
end
