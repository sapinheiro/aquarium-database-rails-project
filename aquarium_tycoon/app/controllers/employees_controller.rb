class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      begin
	if @employee.save
      format.html { redirect_to @employee, notice: 'Employee successfully added.' }
        format.json { render :show, status: :ok, location: @employee }
	else 
		format.html {render :new }
		format.json {render json: @employee.errors, status: :unprocessable_entity }
	end
      rescue Exception => e
	      @employee.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': INSERT')[0].strip)
	      format.html {render :new }
	      format.json {render json: @employee.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      begin
	if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee updated.' }
        format.json { render :show, status: :ok, location: @employee }
	else 
		format.html {render :edit }
		format.json {render json: @employee.errors, status: :unprocessable_entity }
	end
      rescue Exception => e
	      @employee.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip)
	      format.html {render :edit }
	      format.json {render json: @employee.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
	respond_to do |format|	
   begin
	   if @employee.update(fired_date: Time.now.strftime("%Y-%m-%d"))
		   format.html { redirect_to employees_url, notice: 'employee fired.'}
        format.json { head :no_content }
	else 
		format.html {redirect_to employes_url, notice: 'firing unsuccessful'}
		format.json {render json: @employee.errors, status: :unprocessable_entity }
	end
      rescue Exception => e
	      @employee.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip)
	      format.html {redirect_to employees_url, notice:  e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip }
	      format.json {head :no_content}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:employee_id, :first_name, :last_name, :hired_date, :fired_date, :salary)
    end
end
