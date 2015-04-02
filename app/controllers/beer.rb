# GET ====================

get '/beers' do
  beer = Beer.all_by_category_and_name
  erb :'beer/index', locals: {beer: beer}
end

get '/beers/new' do
  erb :'beer/new'
end

get '/beers/:id/edit' do
  # Beer.find(params[:id])  this is conventionally correct
  beer = Beer.find_by(id: params[:id])
  erb :'beer/edit', locals: {beer: beer}
end

get '/beers/:id' do
  # If your view is going to use a nested object, make sure to include it in your AR method chain
  beer = Beer.includes(:user).find(params[:id])
  erb :'beer/show', locals: {beer: beer}
end

# POST ===================

post '/beers' do
  # Beer.new(params)
  new_beer = Beer.new(name: params[:name],
    category: params[:category],
    alc_percent: params[:alc_percent],
    description: params[:description],
    user_id: current_user.id)
  if new_beer.save
    redirect "/beers/#{new_beer.id}"
  else
    redirect '/beers'
  end
end

# PUT ====================

put '/beers/:id' do
  beer = Beer.find_by(id: params[:id])

  # Dont use update_attributes - use update(params)
  if beer.update_attributes(name: params[:name],
    category: params[:category],
    alc_percent: params[:alc_percent],
    description: params[:description],
    user_id: current_user.id)
    redirect "/beers/#{beer.id}"
  else
    redirect "/beers/#{beer.id}/edit"
  end
end
