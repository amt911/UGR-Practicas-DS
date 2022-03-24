package Modelo;

public class Cliente {
	private GestorFiltros gestor;

	public Cliente(GestorFiltros g) {
		gestor = g;
	}

	public void peticion(EstadoMotor estado) {
		gestor.peticionFiltros(estado);
	}
}