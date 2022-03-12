public class FactoriaCarreraMontaña implements FactoriaCarreraYBicicleta {

	public Carrera crearCarrera() {
		return new CarreraMontaña();
	}

	public _Bicicleta crearBicicleta(int dorsal) {
		return new BicicletaMontaña(dorsal);
	}
}