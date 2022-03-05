import java.util.Vector;

public class CadenaFiltros {
	public Vector<Filtro> _ordered_ = new Vector<Filtro>();
	public Objetivo _invoca;

	public CadenaFiltros(){
		_ordered_.add(new CalcularVelocidad());
		_ordered_.add(new RepercutirRozamiento());
		_invoca=new Objetivo();
	}

	public double ejecutar(/*double aRevoluciones,*/ EstadoMotor aEstadoMotor) {
		//double inicial=aRevoluciones;
		double inicial=_invoca.revs;
		for(Filtro aux: _ordered_){
			//En vez de aRevoluciones lo suyo es poner una variable auxiliar para asi hacer que los filtros modifiquen las revoluciones que luego se les pasara finalmente a ejecutar de Objetivo.
			inicial=aux.ejecutar(inicial, aEstadoMotor);

		}



		//double aux=0;
		_invoca.ejecutar(inicial, aEstadoMotor);

		return inicial;
		//throw new UnsupportedOperationException();
	}
}