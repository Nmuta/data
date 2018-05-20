class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :avatar_cache]
  skip_before_filter :verify_authenticity_token, only: [:get_user]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def post_user
    parsed_incoming_data = params.first[0].delete("}").delete(":").split('"')

    user_name = params[:new_user_name] || (parsed_incoming_data[3])
    password = params[:new_user_password] ||  (parsed_incoming_data[7])
    campus_id = params[:campus_id] ||  (parsed_incoming_data[10])
    user_id = nil



    user_in_db = User.where(username: user_name)
    if (user_in_db.any?)
      duplicate_user = true;
    else
      u = User.create(username: user_name, password: password, campus_id: campus_id)
      user_id = u.id
      campus_name = u.campus.name
      duplicate_user = false;
    end


    respond_to do |format|
      format.json { render json: {duplicate_user: duplicate_user, user_name: user_name, user_id: user_id, campus_name: campus_name} }
    end
  end

  def get_user
    parsed_incoming_data = params.first[0].split('"')
    usr = params[:username] || parsed_incoming_data[3]
    pass = params[:password] ||  parsed_incoming_data[7]
    hair, skin, facebase, glasses, moustache, earrings, hair_color = nil


    #username for sign in is not case sensitive.
    valid_user = User.where('lower(username) = ? AND password =?', usr.downcase, pass)
    
    valid_user_exists = valid_user.any?
    user_name = valid_user_exists ? valid_user.first.username : nil
    user_id = valid_user_exists ? valid_user.first.id : nil
    campus_name = (valid_user_exists && valid_user.first.campus) ? valid_user.first.campus.name : nil
    avatar_cache = valid_user_exists ? valid_user.first.avatar_cache : nil
    if valid_user_exists && valid_user.first && valid_user.first.active_profile
      vu = valid_user.first
      hair = vu.active_profile.hair
      skin = vu.active_profile.skin
      facebase = vu.active_profile.facebase
      glasses = vu.active_profile.glasses
      earrings = vu.active_profile.earrings
      moustache = vu.active_profile.earrings
      hair_color = vu.active_profile.hair_color
    end

    respond_to do |format|
      format.json { render json: {valid_user: valid_user_exists, user_name: user_name,
                                  user_id: user_id, campus_name: campus_name,
                                  avatar_cache: avatar_cache} }
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
      if @user.update(parsed_incoming_data)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def avatar_cache

    avatar_cache = params.first[0]
    the_array = []

    if avatar_cache
      respond_to do |format|
        the_array.push(avatar_cache)
        if @user.update({avatar_cache: the_array})
          puts"updated new array .>"
          puts the_array
          format.json { render :show, status: :ok, location: @user }
        else
          puts "it did not save"
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
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
      params.require(:user).permit(:username, :email, :campus_id, :first_name, :last_name, :password, :avatar, :avatar_cache)
    end
end
