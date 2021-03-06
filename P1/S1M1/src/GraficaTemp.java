
import java.util.Observer;
import javax.swing.JFrame;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.*;
import org.jfree.chart.axis.*;
import org.jfree.data.category.DefaultCategoryDataset;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sergi
 */
public class GraficaTemp extends Combo {

    //especificar la dimension maxima del vector
    private float _temp[];
    private int ult_pos = 0;
    final private int MAXTEMPS;

    /**
     * Creates new form GraficaTemp
     *
     * @param t
     */
    public GraficaTemp(Temperatura t) {
        super("Grafica temperaturas");
        initComponents();
        //constructor de la grafica
        this.MAXTEMPS = 7;
        _temp = new float[MAXTEMPS];
        _sujetoObservable = t;

    }
    //funcion para crear el dataset de la grafica

    private DefaultCategoryDataset crearDataset() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        String series1 = "temperaturas semanales";

        int posicion_lunes = ult_pos % 7;
        switch (posicion_lunes) {
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
        //inicializaci??n contexto de la gr??fica
            //this.setVisible(false);
            DefaultCategoryDataset dataset = crearDataset();
            //crea una grafica de puntos
            JFreeChart chart = ChartFactory.createLineChart("Temperaturas", "dias semana", "Temp. en Celsius", dataset);
            CategoryPlot plot = (CategoryPlot) chart.getPlot();
            NumberAxis rango = (NumberAxis) plot.getRangeAxis();
            rango.setRange(-30, 50);
            //crea un panel que incluye la grafica
            ChartPanel panel = new ChartPanel(chart);
            //Coloca el panel?
            setContentPane(panel);

            this.setAlwaysOnTop(true);
            this.pack();                 //redimensiona la pagina dinamicamente
            this.setSize(600, 400);      // tama??o de la ventana base
            this.setVisible(true);          //vuelve a poner la ventana visile tras actualziar

    }

    //creo que est?? bien pero repasar
    @Override
    public void update(java.util.Observable o, Object o1) {
        int pos_insertar = ult_pos % MAXTEMPS;
        _temp[pos_insertar] = _sujetoObservable.getTemp();
        mostrarGrafica();
        ult_pos += 1;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
