public class BicicletaMontaña extends _Bicicleta implements Runnable {
        
        BicicletaMontaña(int dorsal){
            super(dorsal);
        }
        @Override
	public void acabarCarrera() {
		acabado = true;
	}

    @Override
    public void run() {
        while(!acabado){
            
        }
        System.out.println("La bicicleta de montaña " + dorsal +" Ha abandonado la carrera");
    }
}