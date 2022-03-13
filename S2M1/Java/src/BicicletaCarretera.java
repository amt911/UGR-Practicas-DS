public class BicicletaCarretera extends Bicicleta {

    BicicletaCarretera(int dorsal, boolean tengoAcabar) {
        super(dorsal, tengoAcabar);
    }

    @Override
    public void acabarCarrera() {
        acabado = true;
    }

    @Override
    public void run() {
        System.out.println("La bicicleta de carretera " + dorsal + " ha entrado en la carrera");

        try {
            if (acabado)
                Thread.sleep(Carrera.getAbandonoTiempo());
            else
                Thread.sleep(60000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }        

        if (acabado) {
            System.out.println("La bicicleta de carretera " + dorsal + " ha abandonado la carrera");
        } else {
            System.out.println("La bicicleta de carretera " + dorsal + " ha terminado la carrera");
        }
    }
}