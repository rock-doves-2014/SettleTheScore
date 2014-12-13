get '/' do
  @user = session[:user_id]
  @confrontations = Confrontation.all
  @tags = Tag.all
  erb :index
end
