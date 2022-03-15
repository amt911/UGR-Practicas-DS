public class BicicletaCarretera extends Bicicleta {

    BicicletaCarretera(int dorsal, boolean tengoAcabar) {
        super(dorsal, tengoAcabar);
    }

    @Override
    public void run() {
        System.out.println("La bicicleta de carretera " + dorsal + " ha comenzado la carrera");

        try {
            if (acabado){
                Thread.sleep(Carrera.getAbandonoTiempo());
                System.out.println("La bicicleta de carretera " + dorsal + " ha abandonado la carrera");
            }
            else{
                Thread.sleep(Carrera.getDuracion()*1000);
                System.out.println("La bicicleta de carretera " + dorsal + " ha terminado la carrera");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }        

        /*
        if (acabado) {
            System.out.println("La bicicleta de carretera " + dorsal + " ha abandonado la carrera");
        } else {
            System.out.println("La bicicleta de carretera " + dorsal + " ha terminado la carrera");
        }
        */
    }
}