
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

    public double getVelocidad(){
        return velocidad;
    }
    

    //A partir de las revoluciones filtradas y con la formula proporcionada, se obtiene la velocidad actual
    public void calcularVelocidad(double radio, double revs){
        velocidad=2*Math.PI*radio*revs*0.06;
    }
    /**
     * Creates new form Velocimetro
     */
    public Velocimetro() {
        velocidad=0;
        initComponents();
    }

    
    public void actualizarVelocimetro(){
        velDisplay.setText(String.format("%.2f", getVelocidad()));
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        velDisplay = new javax.swing.JLabel();

        setBorder(javax.swing.BorderFactory.createTitledBorder("Velocimetro"));
        setName("ejemplo"); // NOI18N

        velDisplay.setText(""+getVelocidad());
        velDisplay.setBorder(javax.swing.BorderFactory.createTitledBorder("Km/h"));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(velDisplay, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 224, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(velDisplay)
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel velDisplay;
    // End of variables declaration//GEN-END:variables
}
