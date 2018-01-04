require 'sinatra/base'
require 'json'
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

  get '/spaces/my-spaces/new' do
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
    if user.save
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect('/users/new')
    end
  end

  get '/spaces' do
    @user = current_user
    @spaces = Space.all
    erb(:spaces)
  end

  get '/spaces/list' do
    content_type :json
    Space.all.map {|space|
      {
        name: space.name,
        description: space.description,
        price: format('%.2f', space.price),
        user: space.user.username,
        id: space.id
        }
    }.to_json
  end

  post '/spaces' do
    space = Space.create(name: params[:name],
      description: params[:description],
      price: params[:price],
      user: current_user)
    redirect "/spaces/#{space.id}"
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash.next[:errors] = ['The email or password is incorrect']
      redirect '/users/new'
    end
  end

  post '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect '/spaces'
  end

  get '/spaces/my-spaces' do
    @spaces = Space.all(user: current_user)
    erb :spaces
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :viewspace
  end

end
