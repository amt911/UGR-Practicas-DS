package Controlador;

import Modelo.*;

public class ControlAutomatico {
    double velocidadAlmacenada;
    private Mandos mando;
    private Objetivo o;
    private EstadoSCACV estado;

    public Objetivo getObjetivo(){
        return o;
    }


    public ControlAutomatico(Objetivo ob){
        velocidadAlmacenada=-1;
        o=ob;
        estado=EstadoSCACV.APAGAR;
    }

    public void setMando(Mandos m){
        mando=m;
    }

    public void setEstado(EstadoSCACV e){
        estado = e;

        if(e==EstadoSCACV.MANTENER)
            velocidadAlmacenada = o.getVelocidad();        
    }
    //IMPLEMENTAR FUNCIONALIDAD PLS

    void caca(){
        switch(estado){
            case APAGAR:
                //velocidadAlmacenada=-1;
                //if(mando.comandoActual!=EstadoMotor.APAGADO)
                    //mando.comandoActual=EstadoMotor.ENCENDIDO;
            break;

            case REINICIAR:
                //if(velocidadAlmacenada!=-1){
                    /*
                    if(velocidadAlmacenada>o.getVelocidad())
                        mando.comandoActual=EstadoMotor.ACELERANDO;

                    else if(velocidadAlmacenada<o.getVelocidad())
                        mando.comandoActual=EstadoMotor.FRENANDO;

                    else{
                        mando.comandoActual=EstadoMotor.ENCENDIDO;
                        estado=EstadoSCACV.MANTENER;
                    }*/
                //}

                if(velocidadAlmacenada!=-1){
                    if(o.getVelocidad()<velocidadAlmacenada)
                        mando.comandoActual=EstadoMotor.ACELERANDO;
                    else
                        mando.comandoActual=EstadoMotor.FRENANDO;                
                }
            break;

            case ACELERAR:
                mando.comandoActual=EstadoMotor.ACELERANDO;
            break;

            case MANTENER:
                if(o.getVelocidad()<velocidadAlmacenada)
                    mando.comandoActual=EstadoMotor.ACELERANDO;
                else
                    mando.comandoActual=EstadoMotor.FRENANDO;
        
            break;
        }
    }
}
