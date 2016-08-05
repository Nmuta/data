class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:get_user]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def post_user
    parsed_incoming_data = params.first[0].split('"')

    user_name = params[:new_user_name] || (parsed_incoming_data[3])
    password = params[:new_user_password] ||  (parsed_incoming_data[7])
    campus_id = params[:campus_id] ||  (parsed_incoming_data[11])
    user_id = nil

    user_in_db = User.where(username: user_name)
    if (user_in_db.any?)
      duplicate_user = true;
    else
      u = User.create(username: user_name, password: password, campus_id: campus_id)
      user_id = u.id
      duplicate_user = false;
    end


    respond_to do |format|
      format.json { render json: {duplicate_user: duplicate_user, user_name: user_name, user_id: user_id} }
    end
  end

  def get_user
    parsed_incoming_data = params.first[0].split('"')
    usr = params[:username] || downcase_param(parsed_incoming_data[3])
    pass = params[:password] ||  downcase_param(parsed_incoming_data[7])

    valid_user = User.where(username: usr, password: pass)
    valid_user_exists = valid_user.any?
    user_name = valid_user_exists ? valid_user.first.username : nil
    user_id = valid_user_exists ? valid_user.first.id : nil

    respond_to do |format|
      format.json { render json: {valid_user: valid_user_exists, user_name: user_name, user_id: user_id} }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def downcase_param(incoming)
      incoming ? incoming.downcase : nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :campus_id, :first_name, :last_name, :password, :avatar)
    end
end
