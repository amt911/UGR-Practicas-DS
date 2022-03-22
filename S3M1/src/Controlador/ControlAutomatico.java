package Controlador;

import Modelo.*;

public class ControlAutomatico {
    private double velocidadAlmacenada;
    private Mandos mando;
    private Objetivo o;
    private EstadoSCACV estado;
    private boolean estaApagado;

    public Objetivo getObjetivo(){
        return o;
    }


    public ControlAutomatico(Objetivo ob){
        estaApagado=true;
        velocidadAlmacenada=-1;
        o=ob;
        estado=EstadoSCACV.APAGAR;
    }

    public void setMando(Mandos m){
        mando=m;
    }

    public void setEstado(EstadoSCACV nuevo){
        estado = nuevo;     

        if(nuevo==EstadoSCACV.MANTENER)     //hmmm
            velocidadAlmacenada = o.getVelocidad();        //hmmm
    }
    //IMPLEMENTAR FUNCIONALIDAD PLS

    void caca(){

        if(mando.comandoActual==EstadoMotor.APAGADO){       //hmmm
            estado=EstadoSCACV.APAGAR;
            velocidadAlmacenada=-1;
        }

        switch(estado){
            case APAGAR:
                //velocidadAlmacenada=-1;
                //if(mando.comandoActual!=EstadoMotor.APAGADO)
                    //mando.comandoActual=EstadoMotor.ENCENDIDO;
                switch(mando.comandoActual){
                    case ACELERANDO:
                        mando.comandoActual = EstadoMotor.ENCENDIDO;
                    break;
                    case FRENANDO:
                        mando.comandoActual = EstadoMotor.ENCENDIDO;
                    break;
                    case ENCENDIDO:
                        mando.comandoActual = EstadoMotor.ENCENDIDO;
                    break;
                    case APAGADO:
                        mando.comandoActual = EstadoMotor.APAGADO;
                    break;
                }
                estaApagado = true;
                    //mando.comandoActual = EstadoMotor.ENCENDIDO;
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

                if(velocidadAlmacenada!=-1 && !estaApagado){
                    if(o.getVelocidad()<velocidadAlmacenada)
                        mando.comandoActual=EstadoMotor.ACELERANDO;
                    else
                        mando.comandoActual=EstadoMotor.FRENANDO;                
                }
            break;

            case ACELERAR:
                estaApagado=false;
                mando.comandoActual=EstadoMotor.ACELERANDO;
            break;

            case MANTENER:
                if(!estaApagado){
                    if(o.getVelocidad()<velocidadAlmacenada)
                        mando.comandoActual=EstadoMotor.ACELERANDO;
                    else
                        mando.comandoActual=EstadoMotor.FRENANDO;
                }
            break;
        }
    }
}
