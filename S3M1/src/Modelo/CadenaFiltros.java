package Modelo;

import java.util.ArrayList;

public class CadenaFiltros {
	private ArrayList<Filtro> filtros;
	private Objetivo objetivo;

	public CadenaFiltros(Objetivo o) {
		filtros = new ArrayList<>();
		objetivo=o;
	}

	public void addFilter(Filtro filtro) {
		filtros.add(filtro);
	}

	public double ejecutar(EstadoMotor estado) {
		double inicial = objetivo.getRevs();

		for (Filtro aux : filtros)
			inicial = aux.ejecutar(inicial, estado);

		objetivo.ejecutar(inicial, estado);

		return inicial;
	}
}