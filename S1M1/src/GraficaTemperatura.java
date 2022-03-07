import java.util.Observer;
 //libtrerias freechar
import javax.swing.JFrame;  
import javax.swing.SwingUtilities;  
  
import org.jfree.chart.ChartFactory;  
import org.jfree.chart.ChartPanel;  
import org.jfree.chart.JFreeChart;  
import org.jfree.data.category.DefaultCategoryDataset;  

public class GraficaTemperatura extends JFrame implements Observer {
    //especificar la dimension maxima del vector
	private float _temp[];
        private int ult_pos = 0;
        final private int MAXTEMPS;
        public Temperatura _sujetoObservable;

    //revisar
    public GraficaTemperatura(Temperatura t) {
        //constructor de la grafica
        super("Grafica temperaturas");
        
        this.MAXTEMPS = 7;
        _temp = new float[MAXTEMPS];
	_sujetoObservable = t;
    }
    
    //funcion para crear el dataset de la grafica
    private DefaultCategoryDataset crearDataset(){
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        String series1= "temperaturas semanales";
        
        /*dataset.addValue(_temp[0], series1, "lunes");  
        dataset.addValue(_temp[1], series1, "martes");  
        dataset.addValue(_temp[2], series1, "miercoles");  
        dataset.addValue(_temp[3], series1, "jueves");  
        dataset.addValue(_temp[4], series1, "viernes");  
        dataset.addValue(_temp[5], series1, "sabado");  
        dataset.addValue(_temp[6], series1, "domingo");*/
        
        int posicion_lunes = ult_pos % 7;
        switch(posicion_lunes){
            case 0:
                dataset.addValue(_temp[1], series1, "martes");  
                dataset.addValue(_temp[2], series1, "miercoles");  
                dataset.addValue(_temp[3], series1, "jueves");  
                dataset.addValue(_temp[4], series1, "viernes");  
                dataset.addValue(_temp[5], series1, "sabado");  
                dataset.addValue(_temp[6], series1, "domingo");
                dataset.addValue(_temp[0], series1, "lunes"); 
                break;
            case 1:
                dataset.addValue(_temp[2], series1, "miercoles");  
                dataset.addValue(_temp[3], series1, "jueves");  
                dataset.addValue(_temp[4], series1, "viernes");  
                dataset.addValue(_temp[5], series1, "sabado");  
                dataset.addValue(_temp[6], series1, "domingo");
                dataset.addValue(_temp[0], series1, "lunes");
                dataset.addValue(_temp[1], series1, "martes");
                break;
            case 2:
                dataset.addValue(_temp[3], series1, "jueves");  
                dataset.addValue(_temp[4], series1, "viernes");  
                dataset.addValue(_temp[5], series1, "sabado");  
                dataset.addValue(_temp[6], series1, "domingo");
                dataset.addValue(_temp[0], series1, "lunes");
                dataset.addValue(_temp[1], series1, "martes");
                dataset.addValue(_temp[2], series1, "miercoles");
                break;
            case 3:
                dataset.addValue(_temp[4], series1, "viernes");  
                dataset.addValue(_temp[5], series1, "sabado");  
                dataset.addValue(_temp[6], series1, "domingo");
                dataset.addValue(_temp[0], series1, "lunes");
                dataset.addValue(_temp[1], series1, "martes");
                dataset.addValue(_temp[2], series1, "miercoles");
                dataset.addValue(_temp[3], series1, "jueves");
                break;
            case 4:
                dataset.addValue(_temp[5], series1, "sabado");  
                dataset.addValue(_temp[6], series1, "domingo");
                dataset.addValue(_temp[0], series1, "lunes");
                dataset.addValue(_temp[1], series1, "martes");
                dataset.addValue(_temp[2], series1, "miercoles");
                dataset.addValue(_temp[3], series1, "jueves");
                dataset.addValue(_temp[4], series1, "viernes"); 
                break;
            case 5:
                dataset.addValue(_temp[6], series1, "domingo");
                dataset.addValue(_temp[0], series1, "lunes");
                dataset.addValue(_temp[1], series1, "martes");
                dataset.addValue(_temp[2], series1, "miercoles");
                dataset.addValue(_temp[3], series1, "jueves");
                dataset.addValue(_temp[4], series1, "viernes");
                dataset.addValue(_temp[5], series1, "sabado");
                break;
            case 6:
                dataset.addValue(_temp[0], series1, "lunes");
                dataset.addValue(_temp[1], series1, "martes");  
                dataset.addValue(_temp[2], series1, "miercoles");  
                dataset.addValue(_temp[3], series1, "jueves");  
                dataset.addValue(_temp[4], series1, "viernes");  
                dataset.addValue(_temp[5], series1, "sabado");  
                dataset.addValue(_temp[6], series1, "domingo");
                break;
                
        }
        
        return dataset;
    }

	
    public void mostrarGrafica() {
        //inicialización contexto de la gráfica
        if(ult_pos >= 6 ){
            this.setVisible(false);
            DefaultCategoryDataset dataset = crearDataset();
            //crea una grafica de puntos
            JFreeChart chart = ChartFactory.createLineChart(  "Temperaturas", "dias semana",   "Temp. en Celsius",    dataset );
            //crea un panel que incluye la grafica
            ChartPanel panel = new ChartPanel(chart);
            //Coloca el panel?
            setContentPane(panel);
            
            this.setAlwaysOnTop(true);  
            this.pack();                 //redimensiona la pagina dinamicamente
            this.setSize(600, 400);      // tamaño de la ventana base
            this.setVisible(true);          //vuelve a poner la ventana visile tras actualziar
        }
                         
    }

    //creo que está bien pero repasar
    @Override
    public void update(java.util.Observable o, Object o1) {
        int pos_insertar = ult_pos % MAXTEMPS;
        _temp[pos_insertar] = _sujetoObservable.getTemp();
         mostrarGrafica();
         ult_pos += 1;
    }
}