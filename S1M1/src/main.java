class main {
    public static void main(String[] args) {
        Temperatura t = new Temperatura();
        GraficaTemperatura gt = new GraficaTemperatura(t);
        PantallaTemperatura pt = new PantallaTemperatura(t);

        t.addObserver(gt);
        
        Thread hebra1 = new Thread(t);
        hebra1.start();
        Thread hebra2 = new Thread(pt);
        hebra2.start();
        System.out.println("FIN");

        
    }
}