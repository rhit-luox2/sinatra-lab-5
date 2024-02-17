require './config/environment'

class UsersController < Sinatra::Base
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET')
  end

  get '/signup' do
    erb :signup
  end

  post '/users' do
    user = User.new(email: params[:email])
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]

    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thanks for signing up! You may now log in!"
      redirect '/login'
    else
      flash.now[:error] = user.errors.full_messages.join(", ")
      erb :signup
    end
  end
end
