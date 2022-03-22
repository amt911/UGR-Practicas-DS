
import java.awt.Color;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */

/**
 *
 * @author andres
 */
public class Mandos extends javax.swing.JPanel {
    EstadoMotor comandoActual;
    /**
     * Creates new form Mandos2
     * @param cliente
     */
    
    public Mandos() {
        comandoActual=EstadoMotor.APAGADO;
        initComponents();
    }
    

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        estado = new javax.swing.JLabel();
        botonEncendido = new javax.swing.JToggleButton();
        botonAcelerador = new javax.swing.JToggleButton();
        botonFreno = new javax.swing.JToggleButton();

        setBorder(javax.swing.BorderFactory.createTitledBorder("Mandos"));
        setMaximumSize(new java.awt.Dimension(613, 168));

        estado.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        estado.setText("APAGADO");

        botonEncendido.setForeground(new java.awt.Color(0, 255, 0));
        botonEncendido.setText("ENCENDER");
        botonEncendido.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonEncender(evt);
            }
        });

        botonAcelerador.setText("ACELERAR");
        botonAcelerador.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        botonAcelerador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonAcelerar(evt);
            }
        });

        botonFreno.setText("FRENAR");
        botonFreno.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonFrenar(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(estado, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(botonEncendido, javax.swing.GroupLayout.DEFAULT_SIZE, 182, Short.MAX_VALUE)
                        .addGap(46, 46, 46)
                        .addComponent(botonAcelerador, javax.swing.GroupLayout.DEFAULT_SIZE, 169, Short.MAX_VALUE)
                        .addGap(44, 44, 44)
                        .addComponent(botonFreno, javax.swing.GroupLayout.DEFAULT_SIZE, 139, Short.MAX_VALUE)
                        .addGap(52, 52, 52))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(estado)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 32, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(botonEncendido)
                    .addComponent(botonAcelerador)
                    .addComponent(botonFreno))
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents



    private void botonEncender(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonEncender
        if(botonEncendido.isSelected()){
            estado.setText("ENCENDIDO");
            botonEncendido.setForeground(Color.red);
            botonEncendido.setText("APAGAR");

            comandoActual=EstadoMotor.ENCENDIDO;
        }
        else{
            estado.setText("APAGADO");
            botonEncendido.setForeground(Color.green);
            botonEncendido.setText("ENCENDER");

            resetFreno();
            resetAcelerador();            

            comandoActual=EstadoMotor.APAGADO;
        }
    }//GEN-LAST:event_botonEncender

    private void botonAcelerar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonAcelerar
        //Solamente se entra si no esta el freno activado y el coche esta encendido
        if(!botonFreno.isSelected() && botonEncendido.isSelected()){
            //Primer caso: Encendido y pulsado
            if(botonAcelerador.isSelected()){
                botonAcelerador.setText("Soltar Acelerador");
                botonAcelerador.setForeground(Color.red);
                estado.setText("ACELERANDO");

                comandoActual=EstadoMotor.ACELERANDO;
            }

            //Segundo caso: Soltado Acelerador
            else{
                botonAcelerador.setText("ACELERAR");
                botonAcelerador.setForeground(Color.black);
                estado.setText("ENCENDIDO");
                comandoActual=EstadoMotor.ENCENDIDO;
            }
        }
        
        //Es necesario resetear el boton del acelerador porque se queda presionado
        else{
            resetAcelerador();
        }
    }//GEN-LAST:event_botonAcelerar

    private void botonFrenar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonFrenar
        //Solamente se entra si no esta el acelerador activado y el coche esta encendido
        if(!botonAcelerador.isSelected() && botonEncendido.isSelected()){

            //Primer caso: Freno pulsado
            if(botonFreno.isSelected()){
                botonFreno.setText("Soltar Freno");
                botonFreno.setForeground(Color.red);
                estado.setText("FRENANDO");

                comandoActual=EstadoMotor.FRENANDO;
            }

            //Segundo caso: Soltado Freno
            else{
                botonFreno.setText("FRENAR");
                botonFreno.setForeground(Color.black);
                estado.setText("ENCENDIDO");

                comandoActual=EstadoMotor.ENCENDIDO;
            }
        }
        //En caso de no cumplirse se resetea el estado del boton
        else{
            resetFreno();
        }
    }//GEN-LAST:event_botonFrenar


    private void resetFreno(){
        botonFreno.setText("FRENAR");
        botonFreno.setForeground(Color.black);
        botonFreno.setSelected(false);
    }
    
    
    private void resetAcelerador(){
        botonAcelerador.setText("ACELERAR");
        botonAcelerador.setForeground(Color.black);
        botonAcelerador.setSelected(false);        
    }
    
    public EstadoMotor getComandoActual(){
        return comandoActual;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton botonAcelerador;
    private javax.swing.JToggleButton botonEncendido;
    private javax.swing.JToggleButton botonFreno;
    private javax.swing.JLabel estado;
    // End of variables declaration//GEN-END:variables
}
