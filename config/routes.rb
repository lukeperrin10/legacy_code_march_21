Rails.application.routes.draw do
   namespace :api do
     resources :image_analyses, only: [:create]
   end
end
