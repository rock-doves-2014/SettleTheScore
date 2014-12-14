post '/vote/true' do
  if session[:user_id]
    vote = Vote.find_or_create_by(confrontation_id: params[:id], user_id: session[:user_id])
    vote.true_vote
    vote.toggle_vote! unless vote.vote == true
    redirect ("/confrontation/#{params[:id]}")
  else
    redirect '/login'
  end
end

post '/vote/false' do
  if session[:user_id]
    vote = Vote.find_or_create_by(confrontation_id: params[:id], user_id: session[:user_id])
    vote.false_vote
    vote.toggle_vote! unless vote.vote == false
    redirect ("/confrontation/#{params[:id]}")
  else
    redirect '/login'
  end
end
