import java.util.Vector;

public class GestorFiltros {
	private CadenaFiltros _gestiona;
	//public double revs;	//Cutre no, lo siguiente

	public GestorFiltros(){
		/*
		_gestiona=new CadenaFiltros();

		_gestiona.addFilter(new CalcularVelocidad());
		_gestiona.addFilter(new RepercutirRozamiento());		*/
		this(5000, 0.15, -37);
	}

	public GestorFiltros(Vector<Filtro> filtros, double radioObjetivo){
		_gestiona=new CadenaFiltros(radioObjetivo);

		for(Filtro aux : filtros)
			_gestiona.addFilter(aux);
	}

	//Constructor especifico para probar los parametros del vehiculo
	public GestorFiltros(double maxR, double radio, int roz){
		_gestiona=new CadenaFiltros(radio);

		_gestiona.addFilter(new CalcularVelocidad(maxR));
		_gestiona.addFilter(new RepercutirRozamiento(roz));		
	}

	public GestorFiltros(Vector<Filtro> filtros){
		this(filtros, 0.15);
	}

	public void addFilter(Filtro filtro){
		_gestiona.addFilter(filtro);
	}

	public void peticionFiltros(EstadoMotor estadoMotor) {
		_gestiona.ejecutar(estadoMotor);
	}

	public CadenaFiltros getCadenaFiltros(){
		return _gestiona;
	}
}