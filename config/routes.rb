Rails.application.routes.draw do
  # get 'wellcome/index'
  resources :coins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'wellcome#index'

end
