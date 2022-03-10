public class BicicletaMontaña implements _Bicicleta, Runnable {
        private int dorsal;
        private boolean acabado;
        
        BicicletaMontaña(int dorsal){
            this.dorsal = dorsal;
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