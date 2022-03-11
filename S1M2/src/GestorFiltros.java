import java.util.ArrayList;

public class GestorFiltros {
	private CadenaFiltros cadenaFiltros;
        
        
        //Constructor por defecto con parametros basicos para que sea usable
	public GestorFiltros(){
		this(5000, 0.15, -37);
	}

	public GestorFiltros(ArrayList<Filtro> filtros, double radioObjetivo){
		cadenaFiltros=new CadenaFiltros(radioObjetivo);

		for(Filtro aux : filtros)
			cadenaFiltros.addFilter(aux);
	}

	//Constructor especifico para probar los parametros del vehiculo
	public GestorFiltros(double maxR, double radio, int roz){
		cadenaFiltros=new CadenaFiltros(radio);

		cadenaFiltros.addFilter(new CalcularVelocidad(maxR));
		cadenaFiltros.addFilter(new RepercutirRozamiento(roz));		
	}

	public GestorFiltros(ArrayList<Filtro> filtros){
		this(filtros, 0.15);
	}

	public void addFilter(Filtro filtro){
		cadenaFiltros.addFilter(filtro);
	}

	public void peticionFiltros(EstadoMotor estadoMotor) {
		cadenaFiltros.ejecutar(estadoMotor);
	}

	public CadenaFiltros getCadenaFiltros(){
		return cadenaFiltros;
	}
}