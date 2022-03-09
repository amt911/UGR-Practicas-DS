
import java.util.ArrayList;

class main {
    public static void main(String[] args) {
        Temperatura t_g = new Temperatura();
        Temperatura t_l = new Temperatura();
        Temperatura t_m = new Temperatura();
        Temperatura t_b = new Temperatura();
        ArrayList<Temperatura> temps;
        temps = new ArrayList();
        temps.add(t_g);
        temps.add(t_l);
        temps.add(t_m);
        temps.add(t_b);
        
        GraficaTemp gt = new GraficaTemp(t_g);
        PantallaTemp pt = new PantallaTemp(t_g);
        botonCambio bc = new botonCambio(t_g);
        tiempoSatelital ts = new tiempoSatelital(temps);
        
        t_g.addObserver(gt);
        t_g.addObserver(ts);
        t_l.addObserver(ts);
        t_b.addObserver(ts);
        t_m.addObserver(ts);
        
        Thread hebra1 = new Thread(t_g);
        hebra1.start();
        Thread hebra2 = new Thread(t_b);
        hebra2.start();
        Thread hebra3 = new Thread(t_m);
        hebra3.start();
        Thread hebra4 = new Thread(t_l);
        hebra4.start();
        Thread hebra5 = new Thread(pt);
        hebra5.start();
        
        System.out.println("FIN");

    }
}