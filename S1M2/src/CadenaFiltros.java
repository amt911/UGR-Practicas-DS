import java.util.ArrayList;

public class CadenaFiltros {
	private ArrayList<Filtro> filtros;
	private Salpicadero salpicadero;

	public CadenaFiltros(Salpicadero s) {
		filtros = new ArrayList<>();
		salpicadero = s;
	}

	/*
	 * public CadenaFiltros(double radioObjetivo, Salpicadero s){
	 * filtros=new ArrayList<Filtro>();
	 * salpicadero=s;//new Salpicadero(radioObjetivo);
	 * }
	 */

	public void setSalpicadero(Salpicadero sal) {
		salpicadero = sal;
	}

	public void addFilter(Filtro filtro) {
		filtros.add(filtro);
	}

	public double ejecutar(EstadoMotor estado) {
		double inicial = salpicadero.getRevs();

		for (Filtro aux : filtros) {
			inicial = aux.ejecutar(inicial, estado);
		}

		salpicadero.ejecutar(inicial, estado);

		return inicial;
	}

	public Salpicadero getSalpicadero() {
		return salpicadero;
	}
}