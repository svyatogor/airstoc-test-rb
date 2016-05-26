Rails.application.routes.draw do
  scope :api, defaults: {format: 'json'} do
    resources :videos, except: [:new, :edit]
    get '/:location/videos' => 'videos#index'
    get '/categories/*categories/videos' => 'videos#index'
    resources :categories, except: [:new, :edit] do
      resources :videos, except: [:new, :edit, :create, :update, :destroy]
    end
  end
end
