class FeedingLogsController < ApplicationController
  before_action :set_feeding_log, only: [:show, :edit, :update, :destroy]

  # GET /feeding_logs
  # GET /feeding_logs.json
  def index
    @feeding_logs = FeedingLog.all
  end

  # GET /feeding_logs/1
  # GET /feeding_logs/1.json
  def show
  end

  # GET /feeding_logs/new
  def new
    @feeding_log = FeedingLog.new
  end

  # GET /feeding_logs/1/edit
  def edit
  end

  # POST /feeding_logs
  # POST /feeding_logs.json
  def create
    @feeding_log = FeedingLog.new(feeding_log_params)

    respond_to do |format|
      begin
	if @feeding_log.save
      format.html { redirect_to @feeding_log, notice: 'Feeding Log was successfully added' }
        format.json { render :show, status: :ok, location: @feeding_log }
	else 
		format.html {render :new }
		format.json {render json: @feeding_log.errors, status: :unprocessable_entity }
	end
     rescue Exception => e
	      @feeding_log.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': INSERT')[0].strip)
	      format.html {render :new }
	      format.json {render json: @feeding_log.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /feeding_logs/1
  # PATCH/PUT /feeding_logs/1.json
  def update
    respond_to do |format|
      begin
	if @feeding_log.update(feeding_log_params)
      format.html { redirect_to @feeding_log, notice: 'Feeding Log was successfully updated' }
        format.json { render :show, status: :ok, location: @feeding_log }
	else 
		format.html {render :edit }
		format.json {render json: @feeding_log.errors, status: :unprocessable_entity }
	end
     rescue Exception => e
	     @feeding_log.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip)
	      format.html {render :edit }
	      formt.json {render json: @feeding_log.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /feeding_logs/1
  # DELETE /feeding_logs/1.json
  def destroy
    @feeding_log.destroy
    respond_to do |format|
      format.html { redirect_to feeding_logs_url, notice: 'Feeding log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeding_log
      @feeding_log = FeedingLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feeding_log_params
      params.require(:feeding_log).permit(:feeding_id, :time, :food, :quantity, :employee_id, :tank_id)
    end
end
