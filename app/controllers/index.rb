get '/' do
  @user = session[:user_id]
  @confrontations = Confrontation.all
  erb :index
end
