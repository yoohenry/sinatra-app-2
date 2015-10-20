# Homepage (Root path)
# enable :sessions

# get '/' do
#   session["value"] = "hello world"
#   erb :index
# end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/signup' do 
  @user = User.new
  erb :'tracks/signup'
end

post '/tracks/signup' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
    )
    if @user.save
      cookies[:user_id] = @user.id
      redirect to("/tracks")
    else
      erb :"tracks/signup"
    end
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

post '/tracks' do
  @track = Track.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
    )
    if @track.save
      redirect '/tracks'
    else
      erb :'tracks/new'
    end
end
