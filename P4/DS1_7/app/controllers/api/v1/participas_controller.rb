module Api
module V1
  class ParticipasController < ApplicationController

skip_before_action :verify_authenticity_token

def show
      @participa = Participa.where(torneo_id: params[:id]).joins(:usuario).select("usuarios.nombre, participas.*").order(puntuacion: :desc)
      if (@participa!=nil)
        render json: @participa, status: :ok
  else
       render json: :nothing, status: :not_found
    end
end

def index
        render json: Participa.all, status: :ok
end

def update
 @participa = Participa.find(params[:id])

  if @participa.update(torneo_params)
        render json: @participa, status: :ok
      else
        render json: @participa.errors, status: :unprocessable_entity
      end
end

def create
    @participa = Participa.new(torneo_params)

      if @participa.save
        render json: @participa, status: :created
      else
        render json: @participa.errors, status: :unprocessable_entity
      end
end

def destroy
    @participa = Participa.find(params[:id])
    if @participa.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
end
private
def torneo_params
      params.require(:participa).permit(:torneo_id, :usuario_id, :puntuacion, :fecha)
end
end
end
end

