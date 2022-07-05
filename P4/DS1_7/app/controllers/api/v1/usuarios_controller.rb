module Api
module V1
  class UsuariosController < ApplicationController

skip_before_action :verify_authenticity_token

def show
    @usuario = Usuario.find_by(id: params[:id])
    if (@usuario!=nil)
      render json: @usuario, status: :ok
    else
      @usuario = Usuario.find_by(nombre: params[:id])

      if(@usuario!=nil)
        render json: @usuario, status: :ok
      else
        render json: :nothing, status: :not_found
      end
    end
end

def index
        render json: Usuario.all, status: :ok
end

def update
 @usuario = Usuario.find(params[:id])

  if @usuario.update(torneo_params)
        render json: @usuario, status: :ok
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
end

def create
    @usuario = Usuario.new(torneo_params)

      if @usuario.save
        render json: @usuario, status: :created
      else
        render json: @usuario.errors, status: :unprocessable_entity
      end
end

def destroy
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
end
private
def torneo_params
      params.require(:usuario).permit(:nombre, :contrasena, :admin)
end
end
end
end

