Augmented.controllers :posts do
  require 'fileutils'

  get :index do
    @posts = Post.all(:order => 'created_at desc')
    render json: @posts
  end

  get :search, :map => "/search" do
    if params[:q] == '' || params[:q].nil?
      @posts = []
    else
      @posts = Post.search(params[:q])
    end
    render json: @posts
  end

  post :create, :map => "/posts" do
    if params[:post][:file]
      userdir = 'public/system/files/'
      FileUtils.mkdir_p(userdir)
      filename = File.join(userdir, params[:post][:file][:filename])
      datafile = params[:post][:file]
      #  "#{datafile[:tempfile].inspect}\n"
      File.open(filename, 'wb') do |file|
        file.write(datafile[:tempfile].read)
      end
      params[:post][:file] = params[:post][:file][:filename]
    end

    @post = Post.new(params[:post])

    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  get :show, :map => "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    render json: @post
  end

  put :update, :map => "/posts/:id" do
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  delete :destroy, :map => "/posts/:id" do
    @post = Post.find(params[:id])
    @post.destroy
  end


  
  
end
