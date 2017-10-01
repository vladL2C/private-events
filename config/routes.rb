Rails.application.routes.draw do
	root 'static_pages#home'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	post '/join', to: 'attendees#create'
	delete '/leave/:id', to: 'attendees#destroy', as: :leave
	get '/my_events', to: 'users#my_events'
	resources :events
  
  
end
