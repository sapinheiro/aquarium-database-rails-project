class EventRegistrationsController < ApplicationController
  before_action :set_event_registration, only: [:show, :edit, :update, :destroy]

  # GET /event_registrations
  # GET /event_registrations.json
  def index
    @event_registrations = EventRegistration.all
  end

  # GET /event_registrations/1
  # GET /event_registrations/1.json
  def show
  end

  # GET /event_registrations/new
  def new
    @event_registration = EventRegistration.new
  end

  # GET /event_registrations/1/edit
  def edit
  end

  # POST /event_registrations
  # POST /event_registrations.json
  def create
    @event_registration = EventRegistration.new(event_registration_params)

    respond_to do |format|
       begin
  if @event_registration.save
      format.html { redirect_to @event_registration, notice: 'Successfully registered for event.' }
        format.json { render :show, status: :ok, location: @event_registration }
  else
    format.html {render :new }
    format.json {render json: @event_registration.errors, status: :unprocessable_entity }
  end
      rescue Exception => e
        @event_registration.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': INSERT')[0].strip)
        format.html {render :new }
        format.json {render json: @event_registration.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /event_registrations/1
  # PATCH/PUT /event_registrations/1.json
  def update
    respond_to do |format|
        begin
  if @event_registration.update(event_registration_params)
        format.html { redirect_to @event_registration, notice: 'Registration successfully updated' }
        format.json { render :show, status: :ok, location: @event_registration }
  else
    format.html {render :edit }
    format.json {render json: @event_registration.errors, status: :unprocessable_entity }
  end
      rescue Exception => e
        @event_registration.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip)
        format.html {render :edit }
        format.json {render json: @event_registration.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /event_registrations/1
  # DELETE /event_registrations/1.json
  def destroy
    @event_registration.destroy
    respond_to do |format|
      format.html { redirect_to event_registrations_url, notice: 'Event registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_registration
      @event_registration = EventRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_registration_params
      params.require(:event_registration).permit(:registration_code, :time, :member_id, :event_id, :guest_count)
    end
end
