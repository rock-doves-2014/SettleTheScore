get '/rebuttal/:id/new' do |id|
  @confrontation = Confrontation.find(id)
  erb :'rebuttal/new'
end

put '/rebuttal' do
  rebuttal = Rebuttal.find_by(user_id: session[:user_id])
  rebuttal.update(counterargument: params[:counterargument])
  @confrontation = Confrontation.find(rebuttal.confrontation_id)
  erb :'confrontation/confrontation'
end
