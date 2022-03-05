import java.util.Vector;

public class CadenaFiltros {
	private Vector<Filtro> _ordered_;// = new Vector<Filtro>();
	private Objetivo _invoca;

	public CadenaFiltros(){
		_ordered_=new Vector<Filtro>();

		/*
		_ordered_.add(new CalcularVelocidad());
		_ordered_.add(new RepercutirRozamiento());*/
		_invoca=new Objetivo();
	}

	public void addFilter(Filtro filtro){
		_ordered_.add(filtro);
	}

	public double ejecutar(EstadoMotor aEstadoMotor) {
		double inicial=_invoca.getRevs().getRevs();		//CUTRISIMO
		for(Filtro aux: _ordered_){
			inicial=aux.ejecutar(inicial, aEstadoMotor);
		}

		_invoca.ejecutar(inicial, aEstadoMotor);

		return inicial;
	}
}