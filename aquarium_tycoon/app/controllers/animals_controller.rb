class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      begin
	if @animal.save
      format.html { redirect_to @animal, notice: 'Animal was successfully added' }
        format.json { render :show, status: :ok, location: @animal }
	else 
		format.html {render :new }
		format.json {render json: @animal.errors, status: :unprocessable_entity }
	end
     rescue Exception => e
	      @animal.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': INSERT')[0].strip)
	      format.html {render :new }
	      format.json {render json: @animal.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      begin
	if @animal.update(animal_params)
      format.html { redirect_to @animal, notice: 'Animal was successfully updated' }
        format.json { render :show, status: :ok, location: @animal }
	else 
		format.html {render :edit }
		format.json {render json: @animal.errors, status: :unprocessable_entity }
	end
     rescue Exception => e
	     @animal.errors.add(:base, e.message.split('Mysql2::Error: ')[1].strip.split(': UPDATE')[0].strip)
	      format.html {render :edit }
	      format.json {render json: @animal.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:animal_id, :name, :species, :tank_id, :birth_date)
    end
end