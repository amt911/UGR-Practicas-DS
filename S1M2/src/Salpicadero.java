/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */

/**
 *
 * @author andres
 */
public class Salpicadero extends javax.swing.JPanel {
	private EstadoMotor _tiene;
	//private Velocimetro velocidad;
	//private CuentaKilometros distancia;
	//private CuentaRevoluciones revs;
	final private double RADIO;	//Se pone de instancia por si se quiere crear otra con otros parametros

	public Salpicadero(){
                initComponents();
		RADIO=0.15;
		_tiene=EstadoMotor.APAGADO;
		//velocidad=new Velocimetro();
		//distancia=new CuentaKilometros();
		//revs=new CuentaRevoluciones();    Creado en initComponents
	}

        
        public void actualizarInfo(){
            velocidad.actualizarVelocimetro();
            distancia.actualizarCuentaKilometros();
            revs.actualizarCuentaRevoluciones();
        }
        
	public Salpicadero(double rads){
                initComponents();
		RADIO=(rads>0)?rads:0.1;

		_tiene=EstadoMotor.APAGADO;
		//velocidad=new Velocimetro();
		//distancia=new CuentaKilometros();
		//revs=new CuentaRevoluciones(); //Creado en initComponents
	}

	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		revs.setRevs(aRevoluciones);

		_tiene=aEstadoMotor;
		//distancia+=2*3.14*radio*revs;
		//distancia.addDistancia(2*Math.PI*RADIO*revs.getRevs());	//MEJORABLE

		//velocidad=2*3.14*radio*revs*0.06;
		velocidad.calcularVelocidad(RADIO, revs.getRevs());	//MEJORABLE
                
                distancia.addDistancia(velocidad.getVelocidad());
/*
		System.out.println("#################################################");
		System.out.println("Revs: "+revs.getRevs());
		System.out.println("Distancia recorrida: "+distancia.getDistancia());
		System.out.println("Velocidad actual: "+velocidad.getVelocidad());
		System.out.println("Estado motor: "+_tiene);
		System.out.println("#################################################");
*/
                
		return  revs.getRevs();	//ARREGLAR ESTE RETURN, NO SE EXACTAMENTE QUE TIENE QUE DEVOLVER
	}


	//Seguramente esto que haga sea un insulto para todos los programadores del mundo
	public double getRevs(){
		return revs.getRevs();
	}

        
        public EstadoMotor getEstado(){
            return _tiene;
        }
    /**
     * Creates new form Salpicadero
     */
        /*
    public Salpicadero() {
        initComponents();
    }
        */

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        distancia = new CuentaKilometros();
        velocidad = new Velocimetro();
        revs = new CuentaRevoluciones();

        setBorder(javax.swing.BorderFactory.createTitledBorder("Salpicadero"));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(distancia, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(velocidad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(revs, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(distancia, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(velocidad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(revs, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private CuentaKilometros distancia;
    private CuentaRevoluciones revs;
    private Velocimetro velocidad;
    // End of variables declaration//GEN-END:variables
}
