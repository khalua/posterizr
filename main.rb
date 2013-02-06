require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'httparty'
require 'json'

get '/' do
  erb :home
end

post '/search' do
  @search = params[:search].gsub(" ","+").gsub("'","")
  @a = HTTParty.get("http://www.omdbapi.com/?t=#{@search}")
  @b = JSON(@a)
  @title = @b["Title"]
  @rated = @b["Rated"]
  @director = @b["Director"]
  @poster = @b["Poster"]

  erb :home

end

get '/about' do
  erb :about
end

get '/faq' do
  erb :faq
end



