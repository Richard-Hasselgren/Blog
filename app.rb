class App < Sinatra::Base
  enable :sessions

  get '/' do
    slim :index
  end

  get '/login' do
    slim :login
  end

  post '/login' do
    user = User.first(uname: params['uname'].downcase)
    if user && user.pass == params['pass']
      session[:user] = user.id
      redirect '/main'
    else
      redirect '/'
    end
  end

end