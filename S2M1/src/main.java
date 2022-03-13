import java.util.ArrayList;

class main {
    public static void main(String[] args) {
     System.out.println("===========| COMIENZA LA CARRERA |===========");
     FactoriaCarreraYBicicleta factoriacarretera = new FactoriaCarreraCarretera();
     FactoriaCarreraYBicicleta factoriamontaña = new FactoriaCarreraMontaña();

     ArrayList <_Bicicleta> biciscarretera = new ArrayList<_Bicicleta>();
     for(int i = 0; i < 30; i++){
        biciscarretera.add(factoriacarretera.crearBicicleta(i));
     }
     ArrayList <_Bicicleta> bicismontaña = new ArrayList<_Bicicleta>();
     for(int i = 30; i < 60; i++){
        bicismontaña.add(factoriamontaña.crearBicicleta(i));
     }

     Carrera carreracarretera = factoriacarretera.crearCarrera();
     carreracarretera.añadirBicicletas(biciscarretera);

     Carrera carreramontaña = factoriacarretera.crearCarrera();
     carreramontaña.añadirBicicletas(bicismontaña);


     carreracarretera.run();
     carreramontaña.run();


     System.out.println("===========| CARRERA TERMINADA |===========");


    }
}
