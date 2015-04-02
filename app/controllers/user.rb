#TODO:
# GET user account page
# GET/PUT to edit user account information
# GET/DELETE to delete user account information

# GET ============================
get '/users/:id' do
  user = User.find_by(id: params[:id])
  erb :'user/show', locals: {user: user}
end

get '/users/:id/edit' do
  user = User.find_by(id: params[:id])
  if user.id == current_user.id
    erb :'user/edit', locals: {user: user}
  else
    #TODO: ERROR MESSAGE
    redirect "/users/#{user.id}"
  end
end

get '/users/:id/delete' do
  user = User.find_by(id: params[:id])
  erb :'user/delete', locals: {user: user}
end

# PUT ============================
put '/users/:id' do
  user = User.find_by(id: params[:id])
  # Since your params match your model attributes, you can do:
  # user.update(params)
  # 
  # which is much more concise.  Too many params/long lines make programmers sad
  #
  # model.update_atrributes is a bit dangerous to use - it bypass the AR validations
  # better to use model.update
  if user.update_attributes(first_name: params[:first_name], last_name: params[:last_name], location: params[:location], user_id: current_user.id)
    redirect "/users/#{user.id}"
  else
    redirect "/users/#{user.id}/edit"
    #TODO: ADD ERROR MESSAGE
  end
end

# DELETE ============================
delete '/users/:id' do
  user = User.find_by(id: params[:id])
  user.destroy
  redirect '/'
end
