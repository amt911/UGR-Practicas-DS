class TorneosController < ApplicationController
  before_action :set_torneo, only: %i[ show edit update destroy ]

  # GET /torneos or /torneos.json
  def index
    @torneos = Torneo.all
  end

  # GET /torneos/1 or /torneos/1.json
  def show
  end

  # GET /torneos/new
  def new
    @torneo = Torneo.new
  end

  # GET /torneos/1/edit
  def edit
  end

  # POST /torneos or /torneos.json
  def create
    @torneo = Torneo.new(torneo_params)

    respond_to do |format|
      if @torneo.save
        format.html { redirect_to torneo_url(@torneo), notice: "Torneo fue creado correctamente." }
        format.json { render :show, status: :created, location: @torneo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @torneo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /torneos/1 or /torneos/1.json
  def update
    respond_to do |format|
      if @torneo.update(torneo_params)
        format.html { redirect_to torneo_url(@torneo), notice: "Torneo fue modificado correctamente." }
        format.json { render :show, status: :ok, location: @torneo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @torneo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /torneos/1 or /torneos/1.json
  def destroy
    @torneo.destroy

    respond_to do |format|
      format.html { redirect_to torneos_url, notice: "Torneo fue destruido correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torneo
      @torneo = Torneo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def torneo_params
      params.require(:torneo).permit(:nombre, :fecha_max_juego, :es_bomba, :multiplier, :piezas_puestas, :descripcion, :probabilidad)
    end
end
