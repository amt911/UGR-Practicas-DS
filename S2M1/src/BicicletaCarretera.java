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
        //mostrar que ha salido de la carrera;
    }
}