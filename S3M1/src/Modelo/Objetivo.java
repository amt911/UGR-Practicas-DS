package Modelo;

import java.util.Random;

import Controlador.Mandos;

public class Objetivo {
    private double distancia, distanciaAbs, revs, velocidad, combustible, consumo;
    private final double COMBUSTIBLE_MAX, COMBUSTIBLE_AVISO = 0.15, FRENOS_AVISO=5e6, PASTILLAS_AVISO=1e8 , ACEITE_AVISO =1e9;
    final private double RADIO;
    private EstadoMotor estado;

    public Objetivo(){
        COMBUSTIBLE_MAX=50;
        revs=0;
        Random r = new Random();
        combustible = r.nextDouble(COMBUSTIBLE_MAX);
        consumo=0;
        distancia=distanciaAbs=revs=velocidad=0;
        RADIO=0.15;
    }

    public EstadoMotor getEstado(){
        return estado;
    }
    
    public Objetivo(double radio, double combMax){
        COMBUSTIBLE_MAX=combMax;
        revs=0;
        consumo=0;
        Random r = new Random();
        combustible = r.nextDouble(COMBUSTIBLE_MAX);
        distancia=distanciaAbs=revs=velocidad=0;        
        RADIO=(radio>0)?radio:0.1;
    }

    public double ejecutar(double revoluciones, EstadoMotor estado) {
        this.estado=estado;
        double rot=(revs/60000)*Mandos.DELAY; 
        //double rot=revs*(Mandos.DELAY/60000);
        
        if(estado==EstadoMotor.ACELERANDO || estado==EstadoMotor.ACELERANDO_SCACV)      //Al soltar el pedal del acelerador no se consume
            consumo=rot*9e-3; //litros
        else
            consumo=0;
        
        combustible=Math.max(0,combustible-consumo);
        //System.out.println("RPM: "+revs);
        //System.out.println("Rotaciones en el momento: "+rot);
        //System.out.println("Combustible restante: "+combustible);
        //System.out.println("Consumo instantaneo: "+consumo);
        revs=revoluciones;

        
        velocidad=2*Math.PI*RADIO*revs*0.06;
        
        addDistancia(velocidad);

        return  revs;
    }
    
    public double getCombustible(){
        return combustible;
    }

    public double getCombustibleMax(){
        return COMBUSTIBLE_MAX;
    }

    public double getCombustibleAviso(){
        return COMBUSTIBLE_AVISO;
    }

    public void llenarCombustible(){
        combustible = COMBUSTIBLE_MAX;
    }

    public double getConsumo(){
        return consumo;
    }

    public double getVelocidad(){
        return velocidad;
    }

    public double getDistancia(){
        return distancia;
    }

    public double getDistanciaAbs(){
        return distanciaAbs;
    }
 
    public double getRevs(){
        return revs;
    }

    private void addDistancia(double velocidadActual){
        double res=velocidadActual*(100/3600000.0);    //Obtenido de la formula de la velocidad y despejando la distancia
        distancia+=res;
        distanciaAbs+=res;
    }

    public void resetDistancia(){
        distanciaAbs=0;
    }
}
