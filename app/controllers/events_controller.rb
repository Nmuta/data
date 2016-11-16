class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  def post_event
    parsed_incoming_data = params.first[0].split('"')

    puts parsed_incoming_data

    user_id = params[:user_id] || (parsed_incoming_data[3]).to_i
    emotion_id = params[:emotion_id] ||  (parsed_incoming_data[7]).to_i
    the_date = params[:the_date] ||  (parsed_incoming_data[11])
    time_of_day = params[:time_of_day] ||  (parsed_incoming_data[15]).gsub(" ","_")
    who_with = params[:who_with_id] ||  (parsed_incoming_data[19]).gsub(" ","_")


    found_person = Partner.where(name: who_with)
    if found_person
      who_with_id = found_person.first.id
    else
      who_with_id = null
    end




    logged_time = DateTime.strptime(the_date,'%Y-%m-%d');
    logged_time = logged_time + 4.hours; # set to 4:00 am on the given day, otherwise it can be read as previous day


    event = Event.create(user_id: user_id, emotion_id: emotion_id, logged_time: logged_time, time_of_day: time_of_day, who_with_id: who_with_id)
    valid = event.persisted?
    respond_to do |format|
      format.json { render json: {valid: valid} }
    end
  end

  def get_user_history
    parsed_incoming_data = params.first[0].split('"')
    user_id = params[:user_id] || (parsed_incoming_data[3]).to_i
    history = Event.where(user_id: user_id).map{|e| {emotion: e.emotion.emotion, logged_time: e.logged_time, time_of_day: e.time_of_day}}
    respond_to do |format|
      format.json { render json: {history: history} }
    end

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    binding.pry
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:user_id, :emotion_id, :logged_time)
    end
end
