class TreatmentLogsController < ApplicationController
  before_action :set_treatment_log, only: [:show, :edit, :update, :destroy]

  # GET /treatment_logs
  # GET /treatment_logs.json
  def index
    @treatment_logs = TreatmentLog.all
  end

  # GET /treatment_logs/1
  # GET /treatment_logs/1.json
  def show
  end

  # GET /treatment_logs/new
  def new
    @treatment_log = TreatmentLog.new
  end

  # GET /treatment_logs/1/edit
  def edit
  end

  # POST /treatment_logs
  # POST /treatment_logs.json
  def create
    @treatment_log = TreatmentLog.new(treatment_log_params)

    respond_to do |format|
      begin
	if @treatment_log.save
      format.html { redirect_to @treatment_log, notice: 'Treatment was successfully added' }
        format.json { render :show, status: :ok, location: @treatment_log }
	else 
		format.html {render :new }
		format.json {render json: @treatment_log.errors, status: :unprocessable_entity }
	end
     rescue Exception => e
	      @treatment_log.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': INSERT')[0].strip)
	      format.html {render :new }
	      format.json {render json: @treatment_log.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /treatment_logs/1
  # PATCH/PUT /treatment_logs/1.json
  def update
    respond_to do |format|
     begin
	if @treatment_log.update(treatment_log_params)
      format.html { redirect_to @treatment_log, notice: 'Treatment was successfully updated' }
        format.json { render :show, status: :ok, location: @treatment_log }
	else 
		format.html {render :edit }
		format.json {render json: @treatment_log.errors, status: :unprocessable_entity }
	end
     rescue Exception => e
	     @treatment_log.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip)
	      format.html {render :edit }
	      format.json {render json: @treatment_log.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /treatment_logs/1
  # DELETE /treatment_logs/1.json
  def destroy
    @treatment_log.destroy
    respond_to do |format|
      format.html { redirect_to treatment_logs_url, notice: 'Treatment log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_log
      @treatment_log = TreatmentLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_log_params
      params.require(:treatment_log).permit(:treatment_id, :time, :medicine, :quantity, :employee_id, :animal_id)
    end
end
