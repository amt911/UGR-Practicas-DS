class Main {
   public static void main(String[] args) {
      int bicisCarretera = 30;
      int bicisMontaña = 30;
      boolean tengoAcabar = false;
      System.out.println("===========| COMIENZA LA CARRERA |===========");

      // creaemos factorias
      FactoriaCarreraYBicicleta factoriacarretera = new FactoriaCarreraCarretera();
      FactoriaCarreraYBicicleta factoriamontaña = new FactoriaCarreraMontaña();

      // cada factoria crea su carrera
      Carrera carreracarretera = factoriacarretera.crearCarrera();
      Carrera carreramontaña = factoriamontaña.crearCarrera();

      float indice = (1 - CarreraCarretera.getTasa()) * bicisCarretera;
      for (int i = 0; i < bicisCarretera; i++) {
         if (i >= (int) indice)
            tengoAcabar = true;

         carreracarretera.añadirBicicleta(factoriacarretera.crearBicicleta(i, tengoAcabar));
      }

      tengoAcabar = false;
      indice = (1 - CarreraMontaña.getTasa()) * bicisCarretera;
      for (int i = 0; i < bicisMontaña; i++) {
         if (i >= (int) indice)
            tengoAcabar = true;
         carreramontaña.añadirBicicleta(factoriamontaña.crearBicicleta(i, tengoAcabar));
      }

      Thread h1 = new Thread(carreracarretera);
      Thread h2 = new Thread(carreramontaña);

      h1.run();
      h2.run();
   }
}
