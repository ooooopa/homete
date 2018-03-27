Rails.application.routes.draw do
  get 'achievement/index'

    root to: "achievement#index"
    resources :achievement do
        collection do
            post:confirm
            get:list
        end
    end
end
