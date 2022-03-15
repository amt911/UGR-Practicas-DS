import java.util.ArrayList;
import java.util.Random;
public abstract class Carrera implements Runnable {
    protected ArrayList<Bicicleta> bicicletas;
    protected static int abandonoTiempo;
    protected static final int DURACION=60;

    public static int getDuracion(){
        return DURACION;
    }

    public Carrera(){
        Random aleatorio=new Random();
        abandonoTiempo=(aleatorio.nextInt()%(DURACION+1))*1000;

        abandonoTiempo=(abandonoTiempo<0)?-abandonoTiempo:abandonoTiempo;

        bicicletas = new ArrayList<Bicicleta>();
    }

    public void añadirBicicleta(Bicicleta bici){
        bicicletas.add(bici);
    }

    public static int getAbandonoTiempo(){
        return abandonoTiempo;
    }

    public void comenzarCarrera(){
        for(Bicicleta aux: bicicletas){
            Thread hebra=new Thread(aux);

            hebra.start();
        }      
    }
    abstract public void acabarCarrera();

}