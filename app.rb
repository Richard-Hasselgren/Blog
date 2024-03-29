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

  get '/main' do
    if session[:user]
      @user = User.get(session[:user])
      @posts = @user.posts
    else
      redirect '/'
    end
    slim :main
  end

  post '/post/create' do
    if session[:user]
      @user = User.get(session[:user])
      Post.create(title: params['title'], content: params['content'], user: @user )
      redirect '/main'
    else
      redirect '/wrong'
    end
  end

  get '/post/:id' do |post_id|
    if session[:user]
      @user = User.get(session[:user])
      @post = Post.get(post_id)
      @comments = @post.comments
      slim :post
    else
      redirect '/wrong'
    end
  end

  post '/post/:id/comment' do |post_id|
    if session[:user]
      @user = User.get(session[:user])
      Comment.create(comment: params['comment'], user: @user, post_id: post_id)
      redirect "/post/#{post_id}"
    else
      redirect '/wrong'
    end
  end

  get '/wrong' do
    slim :wrong
  end

end