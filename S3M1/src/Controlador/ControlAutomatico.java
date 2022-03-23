package Controlador;

import Modelo.*;

public class ControlAutomatico {
    private double velocidadAlmacenada;
    private Mandos mando;
    private Objetivo o;
    private EstadoSCACV estado;
    private boolean estaApagado;

    public EstadoSCACV getEstadoSCACV(){
        return estado;
    }

    public double getVelocidadAlmacenada(){
        return velocidadAlmacenada;
    }

    public Objetivo getObjetivo() {
        return o;
    }

    public ControlAutomatico(Objetivo ob) {
        estaApagado = true;
        //estadoAnterior = EstadoSCACV.APAGAR;
        velocidadAlmacenada = -1;
        o = ob;
        estado = EstadoSCACV.APAGAR;
    }

    public void setMando(Mandos m) {
        mando = m;
    }

    public void setEstado(EstadoSCACV nuevo) {
        estado = nuevo;

        if (nuevo == EstadoSCACV.MANTENER && !estaApagado) // hmmm
            velocidadAlmacenada = o.getVelocidad(); // hmmm
    }
    // IMPLEMENTAR FUNCIONALIDAD PLS

    void accionarControlAutomatico() {
        /*
        if (mando.comandoActual == EstadoMotor.APAGADO) { // hmmm
            estado = EstadoSCACV.APAGAR;
            velocidadAlmacenada = -1;
        }
        */

        //System.out.println("estaApagado: "+estaApagado);
        //System.out.println("Velocidad Alamcenada: "+velocidadAlmacenada);

        switch (estado) {
            case APAGAR:
                switch (mando.comandoActual) {
                    case ACELERANDO:
                        if (estaApagado)
                            mando.comandoActual = EstadoMotor.ACELERANDO;
                        else
                            mando.comandoActual = EstadoMotor.ENCENDIDO;
                        break;
                    case FRENANDO:
                        if (estaApagado)
                            mando.comandoActual = EstadoMotor.FRENANDO;
                        else
                            mando.comandoActual = EstadoMotor.ENCENDIDO;
                        break;
                    case ENCENDIDO:
                        mando.comandoActual = EstadoMotor.ENCENDIDO;
                        break;
                    case APAGADO:
                        mando.comandoActual = EstadoMotor.APAGADO;
                        velocidadAlmacenada=-1;
                        break;

                    case FRENANDO_SCACV:
                        mando.comandoActual=EstadoMotor.ENCENDIDO;
                        break;

                    case ACELERANDO_SCACV:
                    if(estaApagado)
                        mando.comandoActual=EstadoMotor.ACELERANDO;
                    else
                        mando.comandoActual=EstadoMotor.ENCENDIDO;
                    
                        break;
                }
                estaApagado = true;
                break;

            case REINICIAR:
                if (velocidadAlmacenada != -1 && mando.comandoActual!=EstadoMotor.FRENANDO) {
                    estaApagado=false;
                    if (o.getVelocidad() < velocidadAlmacenada)
                        mando.comandoActual = EstadoMotor.ACELERANDO_SCACV;
                    else
                        mando.comandoActual = EstadoMotor.FRENANDO_SCACV;
                
                } else{
                    estado = EstadoSCACV.APAGAR;
                    estaApagado=true;
                }
                

                break;

            case ACELERAR:
                if (o.getVelocidad() > 0 && mando.comandoActual!=EstadoMotor.FRENANDO && mando.comandoActual != EstadoMotor.ACELERANDO) {
                    mando.comandoActual = EstadoMotor.ACELERANDO_SCACV;
                    estaApagado = false;
                } else{
                    estado = EstadoSCACV.APAGAR;
                    estaApagado=true;
                }
                break;

            case MANTENER:      //estaManteniendo
               // if(velocidadAlmacenada==-1 && !estaApagado)
                 //   velocidadAlmacenada = o.getVelocidad();
                
                if (!estaApagado && mando.comandoActual!=EstadoMotor.FRENANDO) {
                    if (o.getVelocidad() < velocidadAlmacenada)
                        mando.comandoActual = EstadoMotor.ACELERANDO_SCACV;
                    else
                        mando.comandoActual = EstadoMotor.FRENANDO_SCACV;
                }
                else{
                    estado=EstadoSCACV.APAGAR;
                    estaApagado=true;
                }

                break;
        }
    }
}
