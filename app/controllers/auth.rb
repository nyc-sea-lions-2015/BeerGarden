# GET ============================
get '/login' do
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

get '/logout' do
  if session[:user_id] = current_user.user_id
    session[:user_id] = nil
    redirect '/login'
  else
    redirect '/'
  end
end

# POST ===========================
post '/signup' do
  new_user = User.new(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect '/beers'
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
