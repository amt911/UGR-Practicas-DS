
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JToggleButton;
import javax.swing.Timer;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

/**
 *
 * @author andres
 */
public class Mandos extends javax.swing.JFrame {
    private static Timer timer;
    public static final int delay=100;      //Delay de los timers en milisegundos
    private static Cliente c;//=new Cliente();
    
    
    /**
     * Se usa para que cuando se invoque una peticion al cliente entre en el timer
     * y ejecute la peticion infinitamente hasta que se intente ejecutar otra,
     * en cuyo caso se para el timer y se inicia uno nuevo
     * */
    
    private void ejecutarRutina(EstadoMotor estado){
        if(timer!=null)
            timer.stop();
        
        timer=new Timer(delay, new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                c.peticion(estado);
            }      
        });
  
        timer.start();
    }
    /**
     * Creates new form Mandos
     */
    public Mandos() {
        c=new Cliente();
        initComponents();
    }
    
    public Mandos(double maxR, double radio, int roz){
        c=new Cliente(maxR, radio, roz);        
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

        panelPrincipal = new javax.swing.JPanel();
        estado = new javax.swing.JLabel();
        botonEncendido = new javax.swing.JToggleButton();
        botonAcelerador = new javax.swing.JToggleButton();
        botonFreno = new javax.swing.JToggleButton();
        salpicadero = c.getGestorFiltros().getCadenaFiltros().getSalpicadero();

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
                        .addGap(59, 59, 59)
                        .addComponent(botonEncendido)
                        .addGap(18, 18, 18)
                        .addComponent(botonAcelerador)
                        .addGap(18, 18, 18)
                        .addComponent(botonFreno))
                    .addGroup(panelPrincipalLayout.createSequentialGroup()
                        .addGap(196, 196, 196)
                        .addComponent(estado))
                    .addGroup(panelPrincipalLayout.createSequentialGroup()
                        .addGap(81, 81, 81)
                        .addComponent(salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(109, Short.MAX_VALUE))
        );
        panelPrincipalLayout.setVerticalGroup(
            panelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelPrincipalLayout.createSequentialGroup()
                .addGap(54, 54, 54)
                .addComponent(estado)
                .addGap(48, 48, 48)
                .addGroup(panelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(botonEncendido)
                    .addComponent(botonAcelerador)
                    .addComponent(botonFreno))
                .addGap(18, 18, 18)
                .addComponent(salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(29, Short.MAX_VALUE))
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
        //Solamente se entra si no esta el acelerador activado
        if(!botonAcelerador.isSelected()){

            //Primer caso: Encendido y pulsado
            if(botonFreno.isSelected() && botonEncendido.isSelected()){
                botonFreno.setText("Soltar Freno");
                botonFreno.setForeground(Color.red);
                estado.setText("FRENANDO");

                ejecutarRutina(EstadoMotor.FRENANDO);
            }

            //Segundo caso: Soltado Freno
            else if(botonEncendido.isSelected() && !botonFreno.isSelected()){
                botonFreno.setText("FRENAR");
                botonFreno.setForeground(Color.black);
                estado.setText("ENCENDIDO");

                ejecutarRutina(EstadoMotor.ENCENDIDO);
            }

            //Tercer caso: Pulsado acelerador con el coche apagado
            else{
                resetFreno(botonFreno);
                ejecutarRutina(EstadoMotor.APAGADO);
            }
        }
        else{
            resetFreno(botonFreno);
        }
    }//GEN-LAST:event_BotonFreno

    private void BotonAcelerar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonAcelerar
        //Solamente se entra si no esta el freno activado
        if(!botonFreno.isSelected()){
            //Primer caso: Encendido y pulsado
            if(botonAcelerador.isSelected() && botonEncendido.isSelected()){
                botonAcelerador.setText("Soltar Acelerador");
                botonAcelerador.setForeground(Color.red);
                estado.setText("ACELERANDO");

                ejecutarRutina(EstadoMotor.ACELERANDO);
            }

            //Segundo caso: Soltado Acelerador
            else if(botonEncendido.isSelected()){
                botonAcelerador.setText("ACELERAR");
                botonAcelerador.setForeground(Color.black);
                estado.setText("ENCENDIDO");

                ejecutarRutina(EstadoMotor.ENCENDIDO);
            }

            //Tercer caso: Pulsado acelerador con el coche apagado
            else{
                resetAcelerador(botonAcelerador);
                ejecutarRutina(EstadoMotor.APAGADO);
            }
        }
        else{
            resetAcelerador(botonAcelerador);
        }
    }//GEN-LAST:event_BotonAcelerar

    private void BotonEncender(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonEncender
        if(botonEncendido.isSelected()){
            estado.setText("ENCENDIDO");
            botonEncendido.setForeground(Color.red);
            botonEncendido.setText("APAGAR");

            ejecutarRutina(EstadoMotor.ENCENDIDO);

            resetAcelerador(botonAcelerador);
            resetFreno(botonFreno);
        }
        else{
            estado.setText("APAGADO");
            botonEncendido.setForeground(Color.green);
            botonEncendido.setText("ENCENDER");
            
            resetAcelerador(botonAcelerador);
            resetFreno(botonFreno);
            ejecutarRutina(EstadoMotor.APAGADO);
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
