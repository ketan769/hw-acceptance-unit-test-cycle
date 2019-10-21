Rottenpotatoes::Application.routes.draw do
  resources :movies do 
    member do 
      get 'search_with_director'
    end  
  end  
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  # get 'smovies/:director',to: 'movies#search_directors',as:'search_directors'

end
