get '/confrontation/new' do
  if session[:user_id]
    erb :'confrontation/new'
  else
    redirect '/login'
  end
end

get '/confrontation/:id' do |id|
  @confrontation = Confrontation.find(id)
  if @confrontation.unanswered_after_24_hours_of_creation?
    @confrontation.destroy_confrontation!
    set_error('This confrontation doesn\'t exist anymore. Sorry!')
    redirect '/'
  else
    erb :'confrontation/confrontation'
  end
end

post '/confrontation' do
  user = User.find(params[:confrontation][:user_id])
  @confrontation = user.confrontations.create(params[:confrontation])
  @confrontation.create_rebuttal(params[:opponent])
  @confrontation.create_tags(params[:tags])
  redirect 'confrontation/<%= @confrontation.id%>'
end
