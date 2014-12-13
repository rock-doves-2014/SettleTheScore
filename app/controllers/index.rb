get '/' do
  @id = session[:user_id]
  @confrontations = Confrontation.all
  erb :index
end
