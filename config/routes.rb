Rails.application.routes.draw do
  resources :items
  post '/items/:id' => 'items#destroy'
  
end
