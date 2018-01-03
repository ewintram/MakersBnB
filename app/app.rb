require 'sinatra/base'
require_relative './models/user'
require_relative './models/booking'
require_relative './models/space'
require 'sinatra/flash'
require_relative 'DataMapperSetup'

class MakersBnB < Sinatra::Base
  data_mapper_setup
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/spaces/new' do
    erb(:newspace)
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users' do
    user = User.create(email: params[:email],
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      password: params[:password],
      password_confirm: params[:password_confirm])
    session[:user_id] = user.id
    redirect '/spaces'
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
      user: nil)
    redirect '/spaces'
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/spaces'
  end

end
