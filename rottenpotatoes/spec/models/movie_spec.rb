require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'find similar movie by director' do 
        let!(:movies){Movie.create([
  {title:'Home_G',rating:'PG',director:'George Lucas',release_date:'1977-05-25' },
  {title:'Spiderman',rating:'PG',director:'Ridley Scott',release_date:'1982-05-25'},
  {title:'Bajrangi Bhaijaan',rating:'R',release_date:'1982-06-25' },
  {title:'Wanted',rating:'R',director:'Prabhudeva',release_date:'1971-03-11'}])}
       it ' movies with same director' do
            movie=Movie.first
            movies=Movie.find_by_director movie.director #find movies with same director 
            movies.each do |movie_result|
            expect(movie_result.director).to eq(movie.director)#comapre if directors are equal or not
            end
        end
       
    end
end
