import java.util.ArrayList;

public class CadenaFiltros {
	private ArrayList<Filtro> filtros;
	private Salpicadero salpicadero;

	public CadenaFiltros(){
		this(0.15);
	}

	public CadenaFiltros(double radioObjetivo){
		filtros=new ArrayList<Filtro>();
                salpicadero=new Salpicadero(radioObjetivo);
	}

	public void addFilter(Filtro filtro){
		filtros.add(filtro);
	}

	public double ejecutar(EstadoMotor estado) {
		double inicial=salpicadero.getRevs(); //CUTRISIMO
		
		for(Filtro aux: filtros){
			inicial=aux.ejecutar(inicial, estado);
		}

		salpicadero.ejecutar(inicial, estado);

		return inicial;
	}
        
        public Salpicadero getSalpicadero(){
            return salpicadero;
        }        
}