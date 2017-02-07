Rails.application.routes.draw do
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "en"} do
    resources :artists, only: [:show, :index]
    resources :events, only: [:show, :index]
    resources :news, only: [:show, :index]
    resources :videos, only: [:index]
    get 'about/index'
    root to: "home#index"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/:locale' => 'home#index'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

end
