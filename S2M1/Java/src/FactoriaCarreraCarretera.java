public class FactoriaCarreraCarretera implements FactoriaCarreraYBicicleta {

	public Carrera crearCarrera() {
		return new CarreraCarretera();
	}

	public Bicicleta crearBicicleta(int dorsal, boolean tengoAcabar) {
		return new BicicletaCarretera(dorsal, tengoAcabar);
	}
}