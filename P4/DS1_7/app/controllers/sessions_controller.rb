class SessionsController < ApplicationController
    def new
    end

    def create
        session[:nombre] = params[:nombre]
        user = Usuario.find_by(nombre: params[:nombre])

        if(user!=nil)
            session[:admin] = user.admin
        end

        if (user.present? && user.contrasena == params[:contrasena])
            session[:usuario_id] = user.id
            redirect_to root_path, notice: "Bienvenido #{user.nombre}"
        else
            flash[:alert] = "Usuario o contraseña incorrectos"
            render :new
        end
    end

    def destroy
        session[:usuario_id] = nil
        session[:nombre] = nil
        session[:admin] = nil

        redirect_to root_path, notice: "Sesión cerrada";
    end
end
