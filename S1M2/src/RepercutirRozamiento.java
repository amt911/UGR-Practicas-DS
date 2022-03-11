public class RepercutirRozamiento implements Filtro {
    private final int ROZAMIENTO;

    //Constructor por defecto con un valor arbitrario
    public RepercutirRozamiento(){
        ROZAMIENTO=-37;
    }

    public RepercutirRozamiento(int roz) {
        if (roz > 0)
                ROZAMIENTO = -10;

        else
                ROZAMIENTO = roz;
    }

    public double ejecutar(double revoluciones, EstadoMotor estado) {
        if((revoluciones+ROZAMIENTO)<=0)
                return 0;

        else
                return revoluciones+ROZAMIENTO;
    }
}