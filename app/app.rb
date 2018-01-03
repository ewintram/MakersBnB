require 'sinatra/base'

class MakersBnB < Sinatra::Base

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
