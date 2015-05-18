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

  get '/sign_up' do
    slim :sign_up
  end

  post '/sign_up' do
    if params['pass'].length <= 3
      redirect '/sign_up'
    end
  end

end