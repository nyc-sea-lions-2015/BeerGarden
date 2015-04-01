# GET =========================
get '/beers/:id/comments' do
  beer = Beer.find_by(id: params[:id])
  comments = beer.comments
  erb :'comment/show', locals: {beer: beer, comments: comments}
end

get '/beers/:id/comments/new' do
  beer = Beer.find_by(id: params[:id])
  erb :'comment/new', locals: {beer: beer}
end

# POST =======================

post '/beers/:id/comments' do
new_comment = Comment.new(content: params[:content], user_id: current_user.id, beer_id: params[:id])
  if new_comment.save
    redirect "/beers/#{params[:id]}/comments"
  else
    redirect "/beers/#{params[:id]}/comments/new"
  end
end
