# GET ============================
get '/login' do
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

get '/logout' do
    session[:user_id] = nil
    redirect '/'
end

# POST ===========================
post '/signup' do
  new_user = User.new(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect '/beers' ## Good redirect out of your post method!
  else
    redirect '/signup?error=notauthorized'
    #TODO: ADD ERROR VIEW TO REDIRECT TO SIGN UP
  end
end

# PUT ============================
put '/login' do
  current_user = User.find_by(username: params[:user][:username])
  if current_user.try(:authenticate, params[:user][:password])
    session[:user_id] = current_user.id
    redirect '/beers'
  else
    redirect '/login?error=notauthorized'
    #TODO: ADD ERROR VIEW TO REDIRECT TO LOG IN
  end
end
