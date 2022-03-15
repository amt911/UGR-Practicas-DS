public class BicicletaMontaña extends Bicicleta {

    BicicletaMontaña(int dorsal, boolean tengoAcabar) {
        super(dorsal, tengoAcabar);
    }

    @Override
    public void run() {
        System.out.println("La bicicleta de montaña " + dorsal + " ha entrado en la carrera");
        try {
            if(acabado){
                Thread.sleep(Carrera.getAbandonoTiempo());
                System.out.println("La bicicleta de montaña " + dorsal + " ha abandonado la carrera");       
            }
            else{
                Thread.sleep(Carrera.getDuracion()*1000);
                System.out.println("La bicicleta de montaña " + dorsal + " ha terminado la carrera");       
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        /*
        if(acabado){
            System.out.println("La bicicleta de montaña " + dorsal + " ha abandonado la carrera");       
        }
        else{
            System.out.println("La bicicleta de montaña " + dorsal + " ha terminado la carrera");       

        }
        */
    }
}