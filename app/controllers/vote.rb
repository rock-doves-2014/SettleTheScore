post '/vote/true' do
  if session[:user_id]
    vote = Vote.find_or_create_by(vote: true, confrontation_id: params[:id], user_id: session[:user_id])
    vote.toggle_vote! unless vote.vote == true
  end
  redirect ("/confrontation/#{params[:id]}")
end

post '/vote/false' do
  if session[:user_id]
    vote = Vote.find_or_create_by(vote: false, confrontation_id: params[:id], user_id: session[:user_id])
    vote.toggle_vote! unless vote.vote == false
  end
  redirect ("/confrontation/#{params[:id]}")
end
