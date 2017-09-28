Rails.application.routes.draw do
	root 'static_pages#home'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	get '/event', to: 'events#new'
	post '/event', to: 'events#create'
	post '/join', to: 'attendees#create'
	resources :events, only: [:index, :show]
  
  
end
