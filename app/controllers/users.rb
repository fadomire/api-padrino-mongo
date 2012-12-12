Augmented.controllers :users do

  before do
    User.token_check(params[:token])
  end

  get :index do
    @users = User.all(:order => 'created_at desc')
    render json: @users
  end

  post :create, :map => "/users" do
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  get :show, :map => "/users/:id" do
    @user = User.find_by_id(params[:id])
    render json: @user
  end

  put :update, :map => "/users/:id" do
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  delete :destroy, :map => "/users/:id" do
    @user = User.find(params[:id])
    @user.destroy
  end

end
