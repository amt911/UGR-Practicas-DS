public class GestorFiltros {
	private CadenaFiltros _gestiona;
	//public double revs;	//Cutre no, lo siguiente

	public GestorFiltros(){
		_gestiona=new CadenaFiltros();
		
		_gestiona.addFilter(new CalcularVelocidad());
		_gestiona.addFilter(new RepercutirRozamiento());		
	}

	public void addFilter(Filtro filtro){
		//_gestiona._ordered_.add(filtro);
		_gestiona.addFilter(filtro);
	}

	public void peticionFiltros(EstadoMotor estadoMotor) {	//Suponemos que siempre esta acelerando
		_gestiona.ejecutar(estadoMotor);
	}
}