class main {
    public static void main(String[] args) {
        GraficaTemperatura gt = new GraficaTemperatura();
        Temperatura t = new Temperatura();
        PantallaTemperatura pt = new PantallaTemperatura(t);

        t.addObserver(gt);
        for(int k = 0; k < 5; k++){
            t.run();
            pt.run();
        }
        System.out.println("FIN");
        
    }
}