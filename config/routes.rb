Rails.application.routes.draw do
  # get 'pages/index'

  root "pages#index"

  namespace :api, default: {format: :json} do
    namespace :v1,  default: {format: :json} do
      resources :greetings do
      end
    end
  end

  get '*page', to: 'pages#index', constraints: ->(req)do
    !req.xhr? && req.format.html?
  end  
end

