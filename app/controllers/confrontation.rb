get '/confrontation/new' do
  if session[:user_id]
    erb :'confrontation/new'
  else
    redirect '/login'
  end
end

get '/confrontation/:id' do |id|
  @confrontation = Confrontation.find(id)
  erb :'confrontation/confrontation'
end

post '/confrontation' do
  user = User.find(params[:confrontation][:user_id])
  @confrontation = user.confrontations.create(params[:confrontation])
  # Make into a class method?
  opponent = User.find_by(email: params[:opponent])
  Rebuttal.create(counterargument: "Unanswered" , user_id: opponent.id, confrontation_id: @confrontation.id)
  ###
  @confrontation.create_tags(params[:tags])
  erb :'confrontation/confrontation'
end
