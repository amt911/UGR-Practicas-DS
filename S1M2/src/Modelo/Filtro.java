package Modelo;

import Controlador.EstadoMotor;

public interface Filtro {
	public double ejecutar(double revoluciones, EstadoMotor estado);
}