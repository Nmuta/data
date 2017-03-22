class TertiariesController < ApplicationController
  before_action :set_tertiary, only: [:show, :edit, :update, :destroy]

  # GET /tertiaries
  # GET /tertiaries.json
  def index
    @tertiaries = Tertiary.all.order(:emotion_id)
  end

  # GET /tertiaries/1
  # GET /tertiaries/1.json
  def show
  end

  # GET /tertiaries/new
  def new
    @tertiary = Tertiary.new
  end

  # GET /tertiaries/1/edit
  def edit
  end

  # POST /tertiaries
  # POST /tertiaries.json
  def create
    @tertiary = Tertiary.new(tertiary_params)

    respond_to do |format|
      if @tertiary.save
        format.html { redirect_to @tertiary, notice: 'Tertiary was successfully created.' }
        format.json { render :show, status: :created, location: @tertiary }
      else
        format.html { render :new }
        format.json { render json: @tertiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tertiaries/1
  # PATCH/PUT /tertiaries/1.json
  def update
    respond_to do |format|
      if @tertiary.update(tertiary_params)
        format.html { redirect_to @tertiary, notice: 'Tertiary was successfully updated.' }
        format.json { render :show, status: :ok, location: @tertiary }
      else
        format.html { render :edit }
        format.json { render json: @tertiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tertiaries/1
  # DELETE /tertiaries/1.json
  def destroy
    @tertiary.destroy
    respond_to do |format|
      format.html { redirect_to tertiaries_url, notice: 'Tertiary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tertiary
      @tertiary = Tertiary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tertiary_params
      params.require(:tertiary).permit(:name, :emotion_id)
    end
end
