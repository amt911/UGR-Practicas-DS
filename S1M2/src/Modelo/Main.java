package Modelo;
import Vista.*;
import Controlador.*;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author andres
 */

public class Main {
    public static void main(String args[]) {
        Objetivo objetivo = new Objetivo(0.15); // Radio de las ruedas
        GestorFiltros gestor = new GestorFiltros(objetivo); // Añadimos al GestorFiltros el Salpicadero recien creado
        gestor.addFilter(new CalcularVelocidad(5000)); // Revoluciones maximas
        gestor.addFilter(new RepercutirRozamiento(-54)); // Rozamiento que se aplica

        Cliente cliente = new Cliente(gestor); // Añadimos al cliente el gestor de filtros
        Salpicadero s=new Salpicadero(objetivo);
        Mandos mando=new Mandos(cliente, s);
        new Interfaz(mando, s);
        // Creamos las hebras pasandole un objeto Mandos2 (JFrame) y pasandole el cliente
        // y el salpicadero
        Thread hebra = new Thread(mando);
        hebra.start();
    }
}
