get '/beers' do
  beer = Beer.all
  erb :'beer/index', locals: {beer: beer}
end
