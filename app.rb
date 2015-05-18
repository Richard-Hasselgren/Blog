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
      redirect '/sign'
    end
    sign_up = User.create(uname: params['uname'].downcase, pass: params['pass'])
    if sign_up && sign_up.valid?
      session[:user] = sign_up.id
      redirect '/main'
    else
      redirect '/sign_up'
    end
  end

end