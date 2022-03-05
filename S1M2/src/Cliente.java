public class Cliente {
	public GestorFiltros _invoca;

	public Cliente(){
		_invoca=new GestorFiltros();
	}
	//Suponemos que siempre esta acelerando por ahora
	public void peticion(EstadoMotor estado) {
		//throw new UnsupportedOperationException();
		_invoca.peticionFiltros(estado);
	}
}