import java.util.ArrayList;
import java.util.Random;
public abstract class Carrera implements Runnable {
    protected ArrayList<Bicicleta> bicicletas;
    protected static int abandonoTiempo;

    public Carrera(){
        Random aleatorio=new Random();
        abandonoTiempo=(aleatorio.nextInt()%60)*1000;

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