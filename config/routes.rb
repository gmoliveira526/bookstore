Rails.application.routes.draw do
 
       	get 'welcome/index'
	root 'welcome#index'

	resources :books do
	  resources :reviews
  end
end
