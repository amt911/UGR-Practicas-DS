public class CarreraCarretera extends Carrera {
    private static final float TASA = 0.1f;

    @Override
    public void run(){
        comenzarCarrera();
         try {
            Thread.sleep(Carrera.getDuracion()*1000);    //El padre (la carrera) espera a las bicicletas
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        acabarCarrera();        
    }

    public static float getTasa(){
        return TASA;
    }

    CarreraCarretera(){
        super();
    }

    public void comenzarCarrera(){
        super.comenzarCarrera();
        System.out.println("La carrera de carretera ha comenzado");

    }

    public void acabarCarrera(){
        System.out.println("La carrera de carretera ha terminado");
    }
}