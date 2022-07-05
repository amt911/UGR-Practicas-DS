class ListatorneosController < ApplicationController
  def index
  end

  def show
  end


  def new
    @torneos = Torneo.all.order(fecha_max_juego: :desc)
  end
  # POST /usuarios or /usuarios.json
  def create
  end

  def destroy
  end

end