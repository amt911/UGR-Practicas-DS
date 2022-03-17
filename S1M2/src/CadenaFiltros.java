import java.util.ArrayList;

public class CadenaFiltros {
	private ArrayList<Filtro> filtros;
	private Salpicadero salpicadero;

	public CadenaFiltros(Salpicadero s) {
		filtros = new ArrayList<>();
		salpicadero = s;
	}

	public void addFilter(Filtro filtro) {
		filtros.add(filtro);
	}

	public double ejecutar(EstadoMotor estado) {
		double inicial = salpicadero.getRevs();

		for (Filtro aux : filtros)
			inicial = aux.ejecutar(inicial, estado);

		salpicadero.ejecutar(inicial, estado);

		return inicial;
	}
}