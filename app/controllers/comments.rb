# GET =========================
get '/beers/:id/comments' do
  beer = Beer.find_by(id: params[:id])
  comments = beer.comments
  erb :'comment/show', locals: {beer: beer, comments: comments}
end

# POST =======================
