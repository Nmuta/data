class RoguesController < ApplicationController
  before_action :set_rogue, only: [:show, :edit, :update, :destroy]
  layout "special"

  # GET /rogues
  # GET /rogues.json
  def index
    @rogues = Rogue.all
  end

  def get_rogues
    rogues = Rogue.all
    respond_to do |format|
      format.json { render json: {data: rogues } }
    end
  end

  # GET /rogues/1
  # GET /rogues/1.json
  def show
  end

  # GET /rogues/new
  def new
    @rogue = Rogue.new
  end

  # GET /rogues/1/edit
  def edit
  end

  # POST /rogues
  # POST /rogues.json
  def create
    @rogue = Rogue.new(rogue_params)

    respond_to do |format|
      if @rogue.save
        format.html { redirect_to @rogue, notice: 'Rogue was successfully created.' }
        format.json { render :show, status: :created, location: @rogue }
      else
        format.html { render :new }
        format.json { render json: @rogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rogues/1
  # PATCH/PUT /rogues/1.json
  def update
    respond_to do |format|
      if @rogue.update(rogue_params)
        format.html { redirect_to @rogue, notice: 'Rogue was successfully updated.' }
        format.json { render :show, status: :ok, location: @rogue }
      else
        format.html { render :edit }
        format.json { render json: @rogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rogues/1
  # DELETE /rogues/1.json
  def destroy
    @rogue.destroy
    respond_to do |format|
      format.html { redirect_to rogues_url, notice: 'Rogue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rogue
      @rogue = Rogue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rogue_params
      params.require(:rogue).permit(:name)
    end
end
