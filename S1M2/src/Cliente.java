
import java.util.ArrayList;

public class Cliente {
	public GestorFiltros salpicadero;

	public Cliente(){
		salpicadero=new GestorFiltros();
	}

	//Constructor especial para poder modificar los parametros de rozamiento, revoluciones maximas y el radio de las ruedas
	public Cliente(double maxR, double radio, int roz){
		salpicadero=new GestorFiltros(maxR, radio, roz);
	}
        
        public Cliente(ArrayList<Filtro> filtros){
            salpicadero=new GestorFiltros(filtros);
        }
        
	public void peticion(EstadoMotor estado) {
		salpicadero.peticionFiltros(estado);
	}

	public GestorFiltros getGestorFiltros(){
		return salpicadero;
	}
}