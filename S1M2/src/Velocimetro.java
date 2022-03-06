
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Timer;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */

/**
 *
 * @author andres
 */
public class Velocimetro extends javax.swing.JPanel {
    private double velocidad;
    private static int instances=0;

    /*
    public Velocimetro(){
        velocidad=0;
    }
    */

    public double getVelocidad(){
        return velocidad;
    }
    
    public void calcularVelocidad(double radio, double revs){
        velocidad=2*Math.PI*radio*revs*0.06;
    }
    /**
     * Creates new form Velocimetro2
     */
    public Velocimetro() {
        instances++;
        initComponents();
        
    int delay = 1000; //milliseconds
  ActionListener taskPerformer2 = new ActionListener() {
      public void actionPerformed(ActionEvent evt) {
          jLabel1.setText(""+getVelocidad());
          //System.out.println("DENTRO DEL ACTIONLISTENER: "+revs);
          //System.out.println("Instancias Velocimetro: "+instances);
      }
  };
  new Timer(delay, taskPerformer2).start();          
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

        setBorder(javax.swing.BorderFactory.createTitledBorder("Velocimetro"));
        setName("ejemplo"); // NOI18N

        jLabel1.setText(""+getVelocidad());
        jLabel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Km/h"));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(34, 34, 34)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 224, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(132, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(35, 35, 35)
                .addComponent(jLabel1)
                .addContainerGap(182, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
