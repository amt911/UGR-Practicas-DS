class PuntuacionesController < ApplicationController  
    # GET /usuarios or /usuarios.json
    def index

    end
  
    # GET /usuarios/1 or /usuarios/1.json
    def show
    end
  
    # GET /usuarios/new
    def new
        valor = params[:valor]
        @participaciones = ActiveRecord::Base.connection.exec_query("SELECT * FROM usuarios,participas WHERE torneo_id=#{valor} AND usuarios.id=usuario_id ORDER BY puntuacion DESC")

    end
  
    # GET /usuarios/1/edit
    def edit
    end
  
    # POST /usuarios or /usuarios.json
    def create

    end
  
    # PATCH/PUT /usuarios/1 or /usuarios/1.json
    def update

    end
  
    # DELETE /usuarios/1 or /usuarios/1.json
    def destroy

    end
  end
  