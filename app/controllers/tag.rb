get '/tag/:id' do |id|
  @tag = Tag.find(id)
  @confrontations = @tag.confrontations
  erb :"tag/tag"
end
