class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  def post_event
    require 'json'
    parsed_incoming_data = JSON.parse(params.first[0])
    puts "here is the id coming in"
    puts parsed_incoming_data["user_id"]

    user_id = parsed_incoming_data["user_id"].to_i
    emotion_id = parsed_incoming_data["emotion_id"].to_i
    secondary = parsed_incoming_data["secondary"]
    tertiary = parsed_incoming_data["tertiary"]
    the_date = parsed_incoming_data["date"]
    time_of_day = parsed_incoming_data["time_of_day"]
    who_with = parsed_incoming_data["who_with"]
    my_response = parsed_incoming_data["response"]
    notes =parsed_incoming_data["reflection"]


    logged_time = DateTime.strptime(the_date,'%Y-%m-%d');
    logged_time = logged_time + 4.hours; # set to 4:00 am on the given day, otherwise it can be read as previous day


    event = Event.create(user_id: user_id, emotion_id: emotion_id,
                         logged_time: logged_time, time_of_day: time_of_day, who_with: who_with,
                          my_response: my_response, notes: notes, secondary: secondary, tertiary: tertiary)
    valid = event.persisted?
    respond_to do |format|
      format.json { render json: {valid: valid} }
    end
  end

  def get_user_history
    parsed_incoming_data = params.first[0].split('"')
    user_id = params[:user_id] || (parsed_incoming_data[3]).to_i


    history = Event.where(user_id: user_id).map{|e| {emotion: e.emotion.emotion,
                                                     logged_time: e.logged_time,
                                                     time_of_day: e.time_of_day,
                                                     secondary: e.secondary,
                                                     tertiary: e.tertiary,
                                                     who_with: e.who_with,
                                                     my_response: e.my_response,
                                                     notes: e.notes
                                                     }}


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
      params.require(:event).permit(:user_id, :emotion_id, :logged_time, :my_response, :notes)
    end
end
