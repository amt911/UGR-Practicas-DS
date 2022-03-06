import java.util.Vector;

public class CadenaFiltros {
	private Vector<Filtro> _ordered_;// = new Vector<Filtro>();
	private Salpicadero _invoca;

	public CadenaFiltros(){
		this(0.15);
	}

	public CadenaFiltros(double radioObjetivo){
		_ordered_=new Vector<Filtro>();
		//_invoca=new Objetivo(radioObjetivo);		
                _invoca=new Salpicadero(radioObjetivo);
	}

	public void addFilter(Filtro filtro){
		_ordered_.add(filtro);
	}

	public double ejecutar(EstadoMotor aEstadoMotor) {
		double inicial=_invoca.getRevs();//_invoca.getRevs().getRevs();		//CUTRISIMO
		
		for(Filtro aux: _ordered_){
			inicial=aux.ejecutar(inicial, aEstadoMotor);
		}

		_invoca.ejecutar(inicial, aEstadoMotor);

		return inicial;
	}
        
        /*
        public Objetivo getSalpicadero(){
            return _invoca;
        }
*/
        
        public Salpicadero getSalpicadero(){
            return _invoca;
        }        
}