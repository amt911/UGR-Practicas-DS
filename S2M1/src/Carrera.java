import java.util.ArrayList;

public abstract class Carrera implements Runnable {
    private ArrayList<_Bicicleta> bicicletas;

    public void Carrera(){
        bicicletas = new ArrayList<_Bicicleta>();
    }

    public void añadirBicicletas(ArrayList<_Bicicleta> bicis){
        bicicletas = bicis;
    }
}