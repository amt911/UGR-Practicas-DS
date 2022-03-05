public class GestorFiltros {
	public CadenaFiltros _gestiona;
	//public double revs;	//Cutre no, lo siguiente
	public GestorFiltros(){
		_gestiona=new CadenaFiltros();
		//revs=0;
	}

	public void addFilter(Filtro filtro){
		_gestiona._ordered_.add(filtro);
	}

	public void peticionFiltros(EstadoMotor estadoMotor) {	//Suponemos que siempre esta acelerando
		_gestiona.ejecutar(estadoMotor);
		//_gestiona.ejecutar();
		//throw new UnsupportedOperationException();

		//System.out.println("revs: "+revs);
	}
}