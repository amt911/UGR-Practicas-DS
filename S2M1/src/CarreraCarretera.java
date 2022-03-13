public class CarreraCarretera extends Carrera implements Runnable {

    CarreraCarretera(int numberRace, ArrayList<_Bicicleta> bicicletas){
        super(numberRace, bicicletas);
    }

    public void startRace(){
        Ended = false;
        System.out.println("La carrera de carretera  " + numberRace +" ha comenzado");

    }

    public void endRace(){
        Ended = true;
        System.out.println("La carrera de carretera  " + numberRace +" ha terminaddo");
    }
}