class JuegaIndividualsController < ApplicationController
  before_action :set_juega_individual, only: %i[ show edit update destroy ]

  # GET /juega_individuals or /juega_individuals.json
  def index
    @juega_individuals = JuegaIndividual.all
  end

  # GET /juega_individuals/1 or /juega_individuals/1.json
  def show
  end

  # GET /juega_individuals/new
  def new
    @juega_individual = JuegaIndividual.new
  end

  # GET /juega_individuals/1/edit
  def edit
  end

  # POST /juega_individuals or /juega_individuals.json
  def create
    @juega_individual = JuegaIndividual.new(juega_individual_params)

    respond_to do |format|
      if @juega_individual.save
        format.html { redirect_to juega_individual_url(@juega_individual), notice: "Juega individual was successfully created." }
        format.json { render :show, status: :created, location: @juega_individual }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @juega_individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juega_individuals/1 or /juega_individuals/1.json
  def update
    respond_to do |format|
      if @juega_individual.update(juega_individual_params)
        format.html { redirect_to juega_individual_url(@juega_individual), notice: "Juega individual was successfully updated." }
        format.json { render :show, status: :ok, location: @juega_individual }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @juega_individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /juega_individuals/1 or /juega_individuals/1.json
  def destroy
    @juega_individual.destroy

    respond_to do |format|
      format.html { redirect_to juega_individuals_url, notice: "Juega individual was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juega_individual
      @juega_individual = JuegaIndividual.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def juega_individual_params
      params.require(:juega_individual).permit(:usuario_id, :puntuacion, :fecha)
    end
end
