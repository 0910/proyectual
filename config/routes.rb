Rails.application.routes.draw do
  
  scope "v2" do
    scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "en"} do
      resources :artists, only: [:show, :index]
      resources :events, only: [:show, :index]
      resources :news, only: [:show, :index]
      resources :videos, only: [:index]
      get '/about' => 'about#show', :defaults => { :id => 1 }
      get '/home' => 'home#v2'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/:locale' => 'home#v2'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
  root 'home#index'
end
