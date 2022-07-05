class ParticipasController < ApplicationController
  before_action :set_participa, only: %i[ show edit update destroy ]

  # GET /participas or /participas.json
  def index
    @participas = Participa.all
  end

  # GET /participas/1 or /participas/1.json
  def show
  end

  # GET /participas/new
  def new
    @participa = Participa.new
  end

  # GET /participas/1/edit
  def edit
  end

  # POST /participas or /participas.json
  def create
    @participa = Participa.new(participa_params)

    respond_to do |format|
      if @participa.save
        format.html { redirect_to participa_url(@participa), notice: "Participa was successfully created." }
        format.json { render :show, status: :created, location: @participa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participas/1 or /participas/1.json
  def update
    respond_to do |format|
      if @participa.update(participa_params)
        format.html { redirect_to participa_url(@participa), notice: "Participa was successfully updated." }
        format.json { render :show, status: :ok, location: @participa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participas/1 or /participas/1.json
  def destroy
    @participa.destroy

    respond_to do |format|
      format.html { redirect_to participas_url, notice: "Participa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participa
      @participa = Participa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participa_params
      params.require(:participa).permit(:torneo_id, :usuario_id, :puntuacion)
    end
end
