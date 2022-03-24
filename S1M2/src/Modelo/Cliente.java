package Modelo;

import Controlador.EstadoMotor;

public class Cliente {
	private GestorFiltros gestor;

	public Cliente(GestorFiltros g) {
		gestor = g;
	}

	public void peticion(EstadoMotor estado) {
		gestor.peticionFiltros(estado);
	}
}