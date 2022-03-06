public class PantallaTemperatura implements Runnable {
	public Temperatura _estacion_meteorlg;
        float _temp;

        public PantallaTemperatura(Temperatura t){
            _estacion_meteorlg = t;
        }
	public void getState() {
            _temp = _estacion_meteorlg.getTemp();
	}

	public float mostrarTempF() {
		return (_temp * 1.8f + 32);
	}

	public float mostrarTempC() {
		return _temp;
	}

	//public void mostrarTemp(){
            //System.out.println("Temp Celsius: " + mostrarTempC() + "\n" +"Temp Farenheit: " + mostrarTempF() + "\n" );
        @Override
    public void run() {
        this.getState();
         System.out.println("Temp Celsius: " + mostrarTempC() + "\n" +"Temp Farenheit: " + mostrarTempF() + "\n" );
    }
    }

    
