require 'sinatra/base'
require 'sinatra/reloader'
require 'bday_checker'

class Birthday < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/answer' do
    session[:day] = params[:day]
    session[:name] = params[:name]
    session[:month] = params[:month]
    # check if birthday today and redirect to /today or /when
  end
end