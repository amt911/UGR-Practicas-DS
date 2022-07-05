module Api
module V1
  class JuegaIndividualsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def show
          @juega_individual = JuegaIndividual.where(usuario_id: params[:id]).order(puntuacion: :desc)
          if (@juega_individual!=nil)
            render json: @juega_individual, status: :ok
      else
          render json: :nothing, status: :not_found
        end
    end

    def index
            render json: JuegaIndividual.all, status: :ok
    end

    def update
    @juega_individual = JuegaIndividual.find(params[:id])

      if @juega_individual.update(torneo_params)
            render json: @juega_individual, status: :ok
          else
            render json: @juega_individual.errors, status: :unprocessable_entity
          end
    end

    def create
        @juega_individual = JuegaIndividual.new(torneo_params)

          if @juega_individual.save
            render json: @juega_individual, status: :created
          else
            render json: @juega_individual.errors, status: :unprocessable_entity
          end
    end

    def destroy
        @juega_individual = JuegaIndividual.find(params[:id])
        if @juega_individual.destroy
          render json: :nothing, status: :ok
        else
          render json: :nothing, status: :unprocessable_entity
        end
    end
    private
    def torneo_params
          params.require(:juega_individual).permit(:usuario_id, :puntuacion, :fecha)
    end
  end
end
end


