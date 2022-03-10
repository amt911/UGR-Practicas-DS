
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
public class botonCambio extends Combo {

    float temp_aux;

    /**
     * Creates new form botonCambio
     *
     * @param t
     */
    public botonCambio(Temperatura t) {
        super("Cambiar Temperatura");
        initComponents();
        texto2.setText("" + temp_aux);
        _sujetoObservable = t;
        temp.setText("Temperatura: " + Math.round(_sujetoObservable.getTemp() * 10d) / 10d);

        setVisible(true);
        barra.addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                temp_aux = barra.getValue();
                texto2.setText("" + temp_aux);
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

        temp = new javax.swing.JLabel();
        texto2 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        barra = new javax.swing.JSlider();
        img = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        getContentPane().add(temp, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 80, -1, -1));

        texto2.setBackground(new java.awt.Color(204, 204, 255));
        texto2.setFont(new java.awt.Font("Verdana", 1, 16)); // NOI18N
        getContentPane().add(texto2, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 148, 70, 30));

        jTextField1.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jTextField1.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTextField1KeyTyped(evt);
            }
        });
        getContentPane().add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 200, 80, -1));

        jLabel1.setFont(new java.awt.Font("Verdana", 1, 26)); // NOI18N
        jLabel1.setText("MODIFICAR TEMPERATURAS");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, -1, -1));

        jButton1.setText("Confirmar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 150, -1, -1));

        barra.setMajorTickSpacing(8);
        barra.setMaximum(34);
        barra.setMinimum(-34);
        barra.setMinorTickSpacing(1);
        barra.setPaintLabels(true);
        barra.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        getContentPane().add(barra, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 190, 240, 40));

        img.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/fondoazul.jpg"))); // NOI18N
        getContentPane().add(img, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 450, 260));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        _sujetoObservable.setTemp(temp_aux);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        float num = Float.parseFloat(jTextField1.getText());
        if(num > 34){
            num = 34;
        }
        else if(num < -34){
            num = -34;
        }
        
        _sujetoObservable.setTemp(num);
        
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jTextField1KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyTyped
        char c = evt.getKeyChar();
        
        if(!Character.isDigit(c) && c != '.' && c != '-'){
            evt.consume();
        }
    }//GEN-LAST:event_jTextField1KeyTyped


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JSlider barra;
    private javax.swing.JLabel img;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JLabel temp;
    private javax.swing.JLabel texto2;
    // End of variables declaration//GEN-END:variables

    @Override
    public void update(Observable o, Object arg) {
        temp.setText("Temperatura: " + Math.round(_sujetoObservable.getTemp() * 10d) / 10d);
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
