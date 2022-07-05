module Api
module V1
  class TorneosController < ApplicationController

skip_before_action :verify_authenticity_token

  def show
      @torneo = Torneo.find_by(id: params[:id])

      if (@torneo!=nil)
        render json: @torneo, status: :ok
      else
        render json: :nothing, status: :not_found
      end
  end

def index
  #SELECT torneo_id,COUNT(*) AS A FROM torneos,participas WHERE torneos.id=torneo_id GROUP BY torneo_id
  #SELECT * FROM torneos,(SELECT torneo_id,COUNT(*) AS jugadores FROM torneos,participas WHERE torneos.id=torneo_id GROUP BY torneo_id) AS B WHERE id=B.torneo_id
  salida=ActiveRecord::Base.connection.exec_query("SELECT * FROM torneos LEFT JOIN (SELECT torneo_id,COUNT(*) AS jugadores FROM torneos,participas WHERE torneos.id=torneo_id GROUP BY torneo_id) AS B ON id=B.torneo_id ORDER BY fecha_max_juego DESC")
        #render json: Torneo.all.order(fecha_max_juego: :desc), status: :ok
        render json: salida, status: :ok
end

def update
 @torneo = Torneo.find(params[:id])

  if @torneo.update(torneo_params)
        render json: @torneo, status: :ok
      else
        render json: @torneo.errors, status: :unprocessable_entity
      end
end

def create
    @torneo = Torneo.new(torneo_params)

      if @torneo.save
        render json: @torneo, status: :created
      else
        render json: @torneo.errors, status: :unprocessable_entity
      end
end

def destroy
    @torneo = Torneo.find(params[:id])
    if @torneo.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
end
private
def torneo_params
      params.require(:torneo).permit(:nombre, :fecha_max_juego, :es_bomba, :multiplier, :piezas_puestas, :descripcion, :probabilidad)
end
end
end
end

