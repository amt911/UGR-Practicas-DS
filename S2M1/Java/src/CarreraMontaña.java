public class CarreraMontaña extends Carrera {
    private static final float TASA = 0.2f;
    @Override
    public void run(){
        comenzarCarrera();
       try {
            Thread.sleep(Carrera.getDuracion()*1000);        //El padre (la carrera) espera a las bicicletas
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        acabarCarrera();
    }

    CarreraMontaña(){
        super();
    }

    public static float getTasa(){
        return TASA;
    }

	public void comenzarCarrera(){
        super.comenzarCarrera();
        System.out.println("La carrera de montaña ha comenzado");
    }

    public void acabarCarrera(){
        System.out.println("La carrera de montaña ha terminado");
    }
}