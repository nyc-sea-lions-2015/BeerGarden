# GET =========================
get '/beers/:id/comments' do
  beer = Beer.find_by(id: params[:id])
  comments = beer.comments
  erb :'comment/show', locals: {beer: beer, comments: comments}
end

get '/beers/:id/comments/new' do
  beer = Beer.find_by(id: params[:id])
  erb :'comment/new', locals: {beer: beer}, layout: false
end

# POST =======================

post '/beers/:id/comments' do
beer = Beer.find_by(id: params[:id])
comment = Comment.new(content: params[:content], user_id: current_user.id, beer_id: params[:id])

  if comment.save
    erb :'comment/_new_comment', locals: {beer: beer, comment: comment}, layout: false
  else
    [500, "OOPS, We messed up."]
  end
end
