require 'sinatra/base'
require_relative './models/user'
require_relative './models/booking'
require_relative './models/space'
require_relative 'DataMapperSetup'

class MakersBnB < Sinatra::Base
  data_mapper_setup

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/spaces/new' do
    erb(:newspace)
  end

  get '/spaces' do
    @user = current_user
    @spaces = Space.all
    erb(:spaces)
  end

  post '/spaces' do
    Space.create(name: params[:name],
      description: params[:description],
      price: params[:price],
      user: current_user)
    redirect '/spaces'
  end

end
