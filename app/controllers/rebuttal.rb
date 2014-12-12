get '/rebuttal/answer/:id' do |id|
  @confrontation = Confrontation.find(id)
  erb :'rebuttal/answer'
end

put '/rebuttal' do
  rebuttal = Rebuttal.find_by(user_id: session[:user_id])
  rebuttal.update(counterargument: params[:counterargument])
  @confrontation = Confrontation.find(rebuttal.confrontation_id)
  erb :'confrontation/confrontation'
end
