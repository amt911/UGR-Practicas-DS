import java.util.Observer;

public class GraficaTemperatura implements Observer {
    //especificar la dimension maxima del vector
	private float _temp[];
        private int ult_pos = 0;
        final private int MAXTEMPS;
        
	public Temperatura _sujetoObservable;

            //revisar
    public GraficaTemperatura() {
        this.MAXTEMPS = 7;
    }

	//descubir como va la grafica
        public void mostrarGrafica() {
		throw new UnsupportedOperationException();
               
	}

        //creo que está bien pero repasar
    @Override
    public void update(java.util.Observable o, Object o1) {
        int pos_insertar = ult_pos % MAXTEMPS;
        _temp[pos_insertar] = _sujetoObservable.getTemp();
        ult_pos += 1;
    }
}