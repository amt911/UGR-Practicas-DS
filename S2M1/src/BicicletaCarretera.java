public class BicicletaCarretera extends _Bicicleta implements Runnable {
        
        BicicletaCarretera(int dorsal){
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
        System.out.println("La bicicleta de carretera " + dorsal +" Ha abandonado la carrera");
    }
}