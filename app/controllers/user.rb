get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])

  if user
    session[:user_id] = user.id
    redirect '/welcome'
  else
    redirect '/login'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/welcome'
  else
    redirect '/signup'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
