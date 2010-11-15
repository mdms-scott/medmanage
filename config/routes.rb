Medmanage::Application.routes.draw do

  resources :patients
  resources :allergies
  resources :drugs

  
  match '/drugs/:id/manage_interactions', :to => 'drugs#manage_interactions', :as => 'manage_interactions', :via => 'post'

  root :to => 'home#index'

end
