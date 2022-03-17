
public class Cliente {
	public GestorFiltros gestor;

	public Cliente(GestorFiltros g) {
		gestor = g;
	}

	// Constructor especial para poder modificar los parametros de rozamiento,
	// revoluciones maximas y el radio de las ruedas
	/*
	 * public Cliente(double maxR, double radio, int roz, GestorFiltros g){
	 * gestor=new GestorFiltros(maxR, radio, roz);
	 * }
	 */
	/*
	 * public Cliente(ArrayList<Filtro> filtros){
	 * gestor=new GestorFiltros(filtros);
	 * }
	 */

	public void peticion(EstadoMotor estado) {
		gestor.peticionFiltros(estado);
	}

	/*
	 * public GestorFiltros getGestorFiltros(){
	 * return gestor;
	 * }
	 */
}