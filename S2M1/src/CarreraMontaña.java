public class CarreraMontaña extends Carrera  extends Carrera implements Runnable {

    CarreraMontaña(int numberRace, ArrayList<_Bicicleta> bicicletas){
        super(numberRace, bicicletas);
    }

	public void startRace(){
        Ended = false;
        System.out.println("La carrera de montaña  " + numberRace +" ha comenzado");

    }

    public void endRace(){
        Ended = true;
        System.out.println("La carrera de montaña  " + numberRace +" ha terminaddo");
    }
}