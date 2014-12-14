get '/tag/:id' do |id|
  @tag = Tag.find(id)
  @confrontations = @tag.confrontations
  erb :"tag/tag"
end

get '/tag' do
  @tag = Tag.find_by(name: params[:tag])
  if @tag == nil
    redirect "/"
  else
  @confrontations = @tag.confrontations
  erb :"tag/tag"
  end
end
