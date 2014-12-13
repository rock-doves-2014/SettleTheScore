get '/tag/:id' do |id|
  @tag = Tag.find(id)
  @confrontations = @tag.confrontations
  erb :"tag/tag"
end

get '/tag' do
  @tag = Tag.find_by(name: params[:tag])
  @confrontations = @tag.confrontations
  erb :"tag/tag"
end
