import java.util.Observer;
 //libtrerias freechar
import javax.swing.JFrame;  
import javax.swing.SwingUtilities;  
  
import org.jfree.chart.ChartFactory;  
import org.jfree.chart.ChartPanel;  
import org.jfree.chart.JFreeChart;  
import org.jfree.data.category.DefaultCategoryDataset;  

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
        System.out.println("*GRÁFICA*");                 
	}

    //creo que está bien pero repasar
    @Override
    public void update(java.util.Observable o, Object o1) {
        int pos_insertar = ult_pos % MAXTEMPS;
        _temp[pos_insertar] = _sujetoObservable.getTemp();
        ult_pos += 1;
    }
}