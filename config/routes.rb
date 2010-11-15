Medmanage::Application.routes.draw do

  resources :patients
  resources :allergies

  root :to => 'home#index'

end
