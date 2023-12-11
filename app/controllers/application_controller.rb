require './config/environment'

class ApplicationController < Sinatra::Application
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :"index.html", locals: { name: "Eliza" }
  end
end
