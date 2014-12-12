get '/confrontation/new' do
  erb :'confrontation/new'
end

get '/confrontation/:id' do |id|
  @confrontation = Confrontation.find(id)
  erb :'confrontation/confrontation'
end

post '/confrontation' do
  user = User.find(params[:confrontation][:user_id])
  @confrontation = user.confrontations.create(params[:confrontation])
  opponent = User.find_by(email: params[:opponent])
  Rebuttal.create(counterargument: "Unanswered" , user_id: opponent.id, confrontation_id: @confrontation.id)
  erb :'confrontation/confrontation'
end
