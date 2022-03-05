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

public class Main{
	public static void main(String [] args){
		System.out.println("Asco de vida");

		Cliente c=new Cliente();

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