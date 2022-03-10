public class BicicletaCarretera implements _Bicicleta, Runnable {
        private int dorsal;
        private boolean acabado;
        
        BicicletaCarretera(int dorsal){
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
        System.out.println("La bicicleta de carretera " + dorsal +" Ha abandonado la carrera");
    }
}