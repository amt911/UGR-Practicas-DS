public class Cliente {
	public GestorFiltros gestor;

	public Cliente(GestorFiltros g) {
		gestor = g;
	}

	public void peticion(EstadoMotor estado) {
		gestor.peticionFiltros(estado);
	}
}