public class FactoriaCarreraMontaña implements FactoriaCarreraYBicicleta {

	public Carrera crearCarrera() {
		return new CarreraMontaña();
	}

	public Bicicleta crearBicicleta(int dorsal, boolean tengoAcabar) {
		return new BicicletaMontaña(dorsal, tengoAcabar);
	}
}