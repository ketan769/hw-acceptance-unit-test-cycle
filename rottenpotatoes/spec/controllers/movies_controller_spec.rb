require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe '#search_with_director' do 
        let!(:movies){Movie.create([
  {title:'Home_G',rating:'PG',director:'George Lucas',release_date:'1977-05-25' },
  {title:'Spiderman',rating:'PG',director:'Ridley Scott',release_date:'1982-05-25'},
  {title:'Bajrangi Bhaijaan',rating:'R',release_date:'1982-06-25' },
  {title:'Wanted',rating:'R',director:'Prabhudeva',release_date:'1971-03-11'}])}
        it 'respond with movies when director present' do #tests the happy path  to go to the movies with same director
            movie=Movie.first
            get :search_with_director, id: movie.id
            expect(response).to render_template(:search_with_director)  #compares the url 
        end
        it 'redirects to movies path when director absent' do  #Tests the sad path 
            movie=Movie.find_by_title('Bajrangi Bhaijaan')
            get :search_with_director,id: movie.id
            expect(response).to redirect_to '/movies' #compares the home page url
        end
        it 'redirects to movies info' do  #Tests the sad path 
            movie=Movie.find_by_title('Bajrangi Bhaijaan')
            get :show,id: movie.id
            expect(response).to render_template(:show) #compares the home page url
        end
    end
end
