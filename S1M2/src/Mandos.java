
import java.awt.Color;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JToggleButton;

/**
 * COMPROBAR LA LOGICA QUE CUANDO SE ESTA ACELERANDO O FRENANDO Y SE APAGA EL MOTOR SE MANTIENE PULSADO EL BOTON
 * http://www.w3big.com/design-pattern/intercepting-filter-pattern.html
 */

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

/**
 *
 * @author andres
 */
public class Mandos extends javax.swing.JFrame implements Runnable{
    public static final int DELAY=100;      //Delay de los timers en milisegundos
    private static Cliente c;
    private static EstadoMotor comandoActual;

    /**
     * Creates new form Mandos
     */
    public Mandos(Cliente client, Salpicadero s) {
        comandoActual=EstadoMotor.APAGADO;
        c=client;
        salpicadero=s;
     
        //Iniciamos el JFrame
        initComponents();
        
        //Mostramos el panel
        setVisible(true);
    }

    //Parte de la hebra de la interfaz de usuario
    @Override
    public void run(){
        while(true){
            c.peticion(comandoActual);  //Se manda la peticion a los Filtros para su posterior actualizacion en el Salpicadero
            salpicadero.actualizarInfo();   //Se pide actualizar los jLabels
            try {
                Thread.sleep(Mandos.DELAY);
            } catch (InterruptedException ex) {
                Logger.getLogger(Mandos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelPrincipal = new javax.swing.JPanel();
        estado = new javax.swing.JLabel();
        botonEncendido = new javax.swing.JToggleButton();
        botonAcelerador = new javax.swing.JToggleButton();
        botonFreno = new javax.swing.JToggleButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        estado.setText("APAGADO");

        botonEncendido.setForeground(new java.awt.Color(0, 255, 0));
        botonEncendido.setText("ENCENDER");
        botonEncendido.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonEncender(evt);
            }
        });

        botonAcelerador.setText("ACELERAR");
        botonAcelerador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonAcelerar(evt);
            }
        });

        botonFreno.setText("FRENAR");
        botonFreno.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonFreno(evt);
            }
        });

        javax.swing.GroupLayout panelPrincipalLayout = new javax.swing.GroupLayout(panelPrincipal);
        panelPrincipal.setLayout(panelPrincipalLayout);
        panelPrincipalLayout.setHorizontalGroup(
            panelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelPrincipalLayout.createSequentialGroup()
                .addGroup(panelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(panelPrincipalLayout.createSequentialGroup()
                        .addGap(196, 196, 196)
                        .addComponent(estado))
                    .addGroup(panelPrincipalLayout.createSequentialGroup()
                        .addGap(66, 66, 66)
                        .addComponent(botonEncendido)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(botonAcelerador)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(botonFreno))
                    .addGroup(panelPrincipalLayout.createSequentialGroup()
                        .addGap(109, 109, 109)
                        .addComponent(salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(114, Short.MAX_VALUE))
        );
        panelPrincipalLayout.setVerticalGroup(
            panelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelPrincipalLayout.createSequentialGroup()
                .addGap(54, 54, 54)
                .addComponent(estado)
                .addGap(54, 54, 54)
                .addGroup(panelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(botonEncendido)
                    .addComponent(botonAcelerador)
                    .addComponent(botonFreno))
                .addGap(18, 18, 18)
                .addComponent(salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(18, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panelPrincipal, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panelPrincipal, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void BotonFreno(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonFreno
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
            resetFreno(botonFreno);
        }
    }//GEN-LAST:event_BotonFreno

    private void BotonAcelerar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonAcelerar
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
            resetAcelerador(botonAcelerador);
        }
    }//GEN-LAST:event_BotonAcelerar

    private void BotonEncender(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonEncender
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
            
            comandoActual=EstadoMotor.APAGADO;
        }
    }//GEN-LAST:event_BotonEncender

    
    //METODO INTERESANTE setSelected(boolean)
    private void resetFreno(JToggleButton freno){
        botonFreno.setText("FRENAR");
        botonFreno.setForeground(Color.black);
        botonFreno.setSelected(false);
    }
    
    
    private void resetAcelerador(JToggleButton acelerador){
        acelerador.setText("ACELERAR");
        acelerador.setForeground(Color.black);
        acelerador.setSelected(false);        
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton botonAcelerador;
    private javax.swing.JToggleButton botonEncendido;
    private javax.swing.JToggleButton botonFreno;
    private javax.swing.JLabel estado;
    private javax.swing.JPanel panelPrincipal;
    private Salpicadero salpicadero;
    // End of variables declaration//GEN-END:variables
}
