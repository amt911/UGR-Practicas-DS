public class FactoriaCarreraCarretera implements FactoriaCarreraYBicicleta {

	public Carrera crearCarrera() {
		return new CarreraCarretera();
	}

	public _Bicicleta crearBicicleta(int dorsal) {
		return new BicicletaCarretera(dorsal);
	}
}