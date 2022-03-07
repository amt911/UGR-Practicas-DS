
import java.util.Observable;
import java.util.Observer;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sergi
 */
public class botonCambio extends javax.swing.JFrame implements Observer {
    
    public Temperatura _sujetoObservable;

    /**
     * Creates new form botonCambio
     * @param t
     */
    public botonCambio(Temperatura t) {
        super("Cambiar Temperatura");
        initComponents();
        _sujetoObservable = t;
        setVisible(true);
        barra.addChangeListener(new ChangeListener(){
            @Override
            public void stateChanged(ChangeEvent e){
                        _sujetoObservable.setTemp(barra.getValue());
            }
});
}


    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        barra = new javax.swing.JSlider();
        img = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 36)); // NOI18N
        jLabel1.setText("Modificar Temperaturas");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 30, -1, -1));

        barra.setMaximum(34);
        barra.setMinimum(-34);
        getContentPane().add(barra, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 180, 240, 40));

        img.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/fondoazul.jpg"))); // NOI18N
        getContentPane().add(img, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 450, 260));

        pack();
    }// </editor-fold>//GEN-END:initComponents



    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JSlider barra;
    private javax.swing.JLabel img;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables

    @Override
    public void update(Observable o, Object arg) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
