
import java.util.Vector;

public class Cliente {
	public GestorFiltros _invoca;

	public Cliente(){
		_invoca=new GestorFiltros();
	}

	//Constructor especial para poder modificar los parametros de rozamiento, revoluciones maximas y el radio de las ruedas
	public Cliente(double maxR, double radio, int roz){
		_invoca=new GestorFiltros(maxR, radio, roz);
	}
        
        public Cliente(Vector<Filtro> filtros){
            _invoca=new GestorFiltros(filtros);
        }
	//Suponemos que siempre esta acelerando por ahora
	public void peticion(EstadoMotor estado) {
		//throw new UnsupportedOperationException();
		_invoca.peticionFiltros(estado);
	}

	public GestorFiltros getGestorFiltros(){
		return _invoca;
	}
}