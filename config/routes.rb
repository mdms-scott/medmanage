Medmanage::Application.routes.draw do

  resources :patients

  root :to => 'home#index'

end
