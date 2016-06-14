# Homepage (Root path)
helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def allow_new_comment
    current_user.reviews.find_by({track_id: @track.id})
  end
  
end

get '/' do
  erb :index
end

get "/signup" do
   @user = User.new
   erb(:signup)
end

post '/signup' do
  email = params[:email]
  username = params[:username]
  password = params[:password]
    
  @user = User.new({ email: email, username: username, password: password })
     
  if @user.save
    redirect(to('/login'))
  else
    erb (:signup)   
  end
end

get '/login' do
   erb :login 
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
    
  if user && user.password == password
    session[:user_id] = user.id
    redirect to(('/'))
  else
  @error_message = "Login failed!"
    erb(:login)
  end
end

get '/logout' do
    session[:user_id] = nil
    redirect to (('/'))
end

get '/tracks' do
	@tracks = Track.all.sort {|a,b| b.like_count <=> a.like_count}
	erb :'tracks/index'
end

get '/tracks/new' do
	@track = Track.new
	erb :'tracks/new'
end

get '/tracks/:id' do
	@track = Track.find params[:id]
	erb :'tracks/show'
end

post '/likes' do

	track_id = params[:track_id]
   
  like = Like.new({ track_id: track_id, user_id: current_user.id })
  like.save
	redirect(back)
end

delete '/likes/:id' do
   like = Like.find(params[:id])
   like.destroy
   redirect(back)
end

post '/tracks' do
	@track = Track.new(
		song_title: params[:song_title],
		author: params[:author],
		url: params[:url],
		user_id: current_user.id
	)
	if @track.save
		redirect '/tracks'
	else
		erb :'/tracks/new'
	end
end

post '/reviews' do
    
  text = params[:text]
  track_id = params[:track_id]
  rating = params[:rating]
    
  review = Review.new({ text: text, track_id: track_id, user_id: current_user.id, rating: rating})
    
  review.save
  redirect(back)
end

delete '/reviews/:id' do
   review = Review.find(params[:id])
   review.destroy

   redirect(back)
end
