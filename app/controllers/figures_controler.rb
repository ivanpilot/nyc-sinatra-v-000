class FiguresController < ApplicationController

  get "/figures" do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure])

    if !params[:landmark][:name].empty?
      @landmark_new = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark_new
    end

    if !params[:title][:name].empty?
      @title_new = Title.create(name: params[:title][:name])
      @figure.titles << @title_new
    end
    @figure.save

    redirect to "/figures"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark][:name].empty?
      @landmark_new = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark_new
    end

    if !params[:title][:name].empty?
      @title_new = Title.create(name: params[:title][:name])
      @figure.titles << @title_new
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end


end

# params = {
#   "figure"=>{
#     "name"=>"Hollande",
#     "title_ids"=>["3"],
#     "landmark_ids"=>["1", "5", "6"]
#   },
#   "landmark"=>{
#     "name"=>""
#   },
#   "title"=>{
#     "name"=>""
#   }
# }
