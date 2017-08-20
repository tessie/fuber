Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  resources :cabs, only: :index, defaults: { format: :json } do
    collection do
      post 'book-nearest', to: 'cabs#book_nearest'
    end
  end

  resources :trips, only: [], defaults: { format: :json } do
    member do
      post 'start'
      post 'end'
    end
  end
end
