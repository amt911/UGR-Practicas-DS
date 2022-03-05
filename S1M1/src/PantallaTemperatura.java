public class PantallaTemperatura {
	public Temperatura _estacion_meteorlg;
        float _temp;

	public void getState() {
            _temp = _estacion_meteorlg.getTemp();
	}

	public float mostrarTempF() {
		return (_temp * 1.8f + 32);
	}

	public float mostrarTempC() {
		return _temp;
	}
        public void mostrarTemp(){
            System.out.println("Temp Celsius: " + mostrarTempC() + "\n" +"Temp Farenheit: " + mostrarTempF() + "\n" );
        }
}