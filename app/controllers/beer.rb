# GET ====================

get '/beers' do
  beer = Beer.all
  erb :'beer/index', locals: {beer: beer}
end

get '/beers/new' do
  erb :'beer/new'
end

get '/beers/:id/edit' do
  beer = Beer.find_by(id: params[:id])
  erb :'beer/edit', locals: {beer: beer}
end

get '/beers/:id' do
  beer = Beer.find_by(id: params[:id])
  erb :'beer/show', locals: {beer: beer}
end

# POST ===================

post '/beers' do
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
