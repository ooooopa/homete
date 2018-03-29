Rails.application.routes.draw do

    root to: "achievement#index"
    resources :message do
      collection do
        post:confirm
        end      
      member do
        get:new
      end
    end
    
    
    
    resources :achievement do
        collection do
          post:confirm
          get:list
        end
    end
end
