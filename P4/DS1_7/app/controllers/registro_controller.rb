class RegistroController < ApplicationController
  before_action :set_usuario, only: %i[ show edit update destroy ]
  def index
    @usuarios = Usuario.all
  end

  def show
  end


  def new
    @usuario = Usuario.new
  end
  # POST /usuarios or /usuarios.json
  def create
    parametros = {nombre: params[:nombre], contrasena: params[:contrasena], admin: false}

    @usuario = Usuario.new(parametros)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to login_path, notice: "Usuario was successfully created." }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  end

end