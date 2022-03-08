/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sergi
 */
public class PantallaTemp extends javax.swing.JFrame implements Runnable {
	public Temperatura _estacion_meteorlg;
        float _temp;
    /**
     * Creates new form GUI
     */
        

    public PantallaTemp(Temperatura t) {
        super("Pantalla Temperaturas");
        initComponents();
        _estacion_meteorlg = t;
        this.setLocationRelativeTo(null);
        setVisible(true);
        
    }


        
	public void getEstado() {
            _temp = _estacion_meteorlg.getTemp();
	}

	public float mostrarTempF() {
		return (_temp * 1.8f + 32);
	}

	public float mostrarTempC() {
		return _temp;
	}

    private PantallaTemp() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private void esperartiempo(){
            try {
			Thread.sleep(1 * 3000);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
        }
    
      @Override
    public void run() {
        while(true){
        this.getEstado();
        System.out.println("Temp Celsius: " + mostrarTempC() + "\n" +"Temp Farenheit: " + mostrarTempF() + "\n" );
        texto.setText("TEMPERATURAS");
        celsius.setText("Celsius: " + mostrarTempC());
        farenheit.setText("Farenheit: " + mostrarTempF());
        esperartiempo();

    }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        celsius = new javax.swing.JLabel();
        farenheit = new javax.swing.JLabel();
        texto = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        celsius.setFont(new java.awt.Font("Tahoma", 0, 20)); // NOI18N
        celsius.setText("jLabel2");
        getContentPane().add(celsius, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 150, 190, 60));

        farenheit.setFont(new java.awt.Font("Tahoma", 0, 20)); // NOI18N
        farenheit.setText("jLabel2");
        getContentPane().add(farenheit, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 210, 210, 60));

        texto.setBackground(new java.awt.Color(153, 153, 255));
        texto.setFont(new java.awt.Font("Verdana", 1, 36)); // NOI18N
        texto.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        texto.setText("texto");
        getContentPane().add(texto, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 10, 360, 120));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/fondoazul.jpg"))); // NOI18N
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 480, 290));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
   

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel celsius;
    private javax.swing.JLabel farenheit;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel texto;
    // End of variables declaration//GEN-END:variables
}
