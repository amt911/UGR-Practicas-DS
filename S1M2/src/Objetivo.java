public class Objetivo {
    private double distancia, distanciaAbs, revs, velocidad;

    final private double RADIO;

    public Objetivo(){
        distancia=distanciaAbs=revs=velocidad=0;
        RADIO=0.15;
    }

    public Objetivo(double radio){
        distancia=distanciaAbs=revs=velocidad=0;        
        RADIO=(radio>0)?radio:0.1;
    }

    public double ejecutar(double revoluciones, EstadoMotor estado) {
        revs=revoluciones;

        velocidad=2*Math.PI*RADIO*revs*0.06;

        addDistancia(velocidad);

        return  revs;
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
