class MispartidasController < ApplicationController
    def index
    end

    def new
        #get partidas del usuario 1
        @partidas = JuegaIndividual.where(usuario_id: session[:usuario_id]).order(puntuacion: :desc);
    end

    def create
        
    end

    def destroy

    end
end