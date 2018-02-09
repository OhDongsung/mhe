Rails.application.routes.draw do
  resource :contacts, only: [:index, :create, :new]
  get '/contacts' => 'contacts#index'

  post '/pme/get' => 'pme#signal_send'
  post '/pme/set' => 'pme#signal_receive'
  get 'pme/set' => 'pme#signal_test'

  get '/' => 'home#hello_world'
  get '/index' => 'home#index'
  get '/contact' => 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
