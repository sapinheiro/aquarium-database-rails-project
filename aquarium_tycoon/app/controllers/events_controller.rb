class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
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

    respond_to do |format|
      begin
	if @event.save
      format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
	else 
		format.html {render :new }
		format.json {render json: @event.errors, status: :unprocessable_entity }
	end
      rescue Exception => e
	      @event.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': INSERT')[0].strip)
	      format.html {render :new }
	      format.json {render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      begin
	if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
	else 
		format.html {render :edit }
		format.json {render json: @event.errors, status: :unprocessable_entity }
	end
      rescue Exception => e
	      @event.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip)
	      format.html {render :edit }
	      format.json {render json: @event.errors, status: :unprocessable_entity}
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
      params.require(:event).permit(:event_id, :title, :price, :managing_employee, :max_guests_per_person, :max_attending, :event_date)
    end
end
