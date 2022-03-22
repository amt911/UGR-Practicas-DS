package Modelo;

public class GestorFiltros {
	private CadenaFiltros cadenaFiltros;

	public GestorFiltros(Objetivo o) {
		cadenaFiltros = new CadenaFiltros(o);
	}

	public void addFilter(Filtro filtro) {
		cadenaFiltros.addFilter(filtro);
	}

	public void peticionFiltros(EstadoMotor estadoMotor) {
		cadenaFiltros.ejecutar(estadoMotor);
	}
}