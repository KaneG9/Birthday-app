require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bday_checker'

class Birthday < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/answer' do
    session[:day] = params[:day].to_i
    session[:name] = params[:name]
    session[:month] = params[:month].to_i
    redirect('/error') unless Date.valid_date?(2021,session[:month],session[:day])
    checker = BdayChecker.new(session[:day], session[:month])
    checker.today? ? redirect('/today') : redirect('/when')
  end

  get '/today' do
    @name = session[:name]
    erb :today
  end

  get '/when' do
    @name = session[:name]
    checker = BdayChecker.new(session[:day], session[:month])
    @days_left = checker.how_long
    erb :when
  end

  get '/error' do
    erb :error
  end
end