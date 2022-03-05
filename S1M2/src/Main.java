import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.*;			//ESTA SIRVE PARA LA CLASE COLOR
//import java.*;

/**
 * TODO:
 * ARREGLAR ATRIBUTOS SUELTOS EN DISTINTAS CLASES Y DARLES SENTIDO
 * INVESTIGAR EL COMPORTAMIENTO DE COMO DEBERIA FUNCIONAR CUANDO EL COCHE ESTA APAGADO O ENCENDIDO
 * IMPLEMENTAR LA INTERFAZ DE USUARIO
 * COMPROBAR LA FORMULA DE LA DISTANCIA QUE SALE MAL
 * GESTORFILTROS REQUIERE DE MAS METODOS PERO NO SE EXACTAMENTE CUALES
 * TIENE SENTIDO QUE EL INCREMENTO DE VELOCIDAD ESTE DENTRO DEL FILTRO?
 * 
 * QUIZAS MAX_REVS PUEDA IR DENTRO DE LA PROPIA INTERFAZ DEL FILTRO?
 * IMPORTANTE COMPROBAR COMO SE DEBEN CREAR LOS OBJETOS, LOS HE HECHO EN CADENA PERO SEGURAMENTE ESTEN MAL
 * IMPORTANTE COMPROBAR VISIBILIDAD DE TODOS LOS COMPONENTES DE CADA CLASE
 */
/*
interface Vehicle {
      
    c.peticion(EstadoMotor.ACELERANDO);
	c.peticion(EstadoMotor.FRENANDO);
	c.peticion(EstadoMotor.APAGADO);
   	c.peticion(EstadoMotor.ENCENDIDO);
}
*/

public class Main extends JPanel{
	//JLabel ejemplo=new JLabel("eSTO ES UNA PRUEBA MAL HECHA");
	static JPanel p;
	static JButton boton;
	static JLabel l;
	static JFrame f;
	public static void main(String [] args){
		f=new JFrame("Ventana de prueba");
		p=new JPanel();
		l=new JLabel("LABEL DE PRUEBA");
		boton=new JButton("Boton de prueba");

		boton.setBounds(400, 300, 300, 40);
		boton.setBackground(Color.orange);
		boton.setForeground(Color.black);
		p.setLayout(null);
		p.add(boton);
		//boton.setBounds(400, 300, 300, 40);
		p.add(l);


		p.setBackground(Color.green);

		f.add(p);
		

		f.setSize(1000, 1000);

		//f.show();
		f.setVisible(true);
		//p.setVisible(true);


		//PARTE DE MI IMPLEMENTACION
		Cliente c=new Cliente(100, 0.15, -5);
		//Cliente c=new Cliente();

		System.out.println("Ahora a ver si funcionan las revs ACELERANDO");

		for(int i=0; i<10; i++)
		c.peticion(EstadoMotor.ACELERANDO);
/*
		System.out.println("Ahora a ver si funcionan las revs FRENANDO");
		System.out.println("---------------------------------------------");
		for(int i=0; i<10; i++)
		c.peticion(EstadoMotor.FRENANDO);		
*/
/*
		System.out.println("Ahora a ver si funcionan las revs APAGADO");
		System.out.println("---------------------------------------------");
		for(int i=0; i<10; i++)
		c.peticion(EstadoMotor.APAGADO);			
*/		
		
		System.out.println("Ahora a ver si funcionan las revs ENCENDIDO");
		System.out.println("---------------------------------------------");
		for(int i=0; i<10; i++)
		c.peticion(EstadoMotor.ENCENDIDO);					
		
	}
}