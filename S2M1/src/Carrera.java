import java.util.ArrayList;
import java.util.Random;

public abstract class Carrera implements Runnable {
    private ArrayList<_Bicicleta> bicicletas;
    protected int numberRace;
    private boolean Ended = true;

    public void Carrera(){
        bicicletas = new ArrayList<_Bicicleta>();
        Random rd = new Random();
        numberRace = rd.nextInt();
    }

    public void añadirBicicletas(ArrayList<_Bicicleta> bicis){
        bicicletas = bicis;
    }


}