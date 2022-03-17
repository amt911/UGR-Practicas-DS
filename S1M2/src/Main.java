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
        Salpicadero salpicadero = new Salpicadero(0.15); // Radio de las ruedas
        GestorFiltros gestor = new GestorFiltros(salpicadero); // Añadimos al GestorFiltros el Salpicadero recien creado
        gestor.addFilter(new CalcularVelocidad(10000)); // Revoluciones maximas
        gestor.addFilter(new RepercutirRozamiento(-24)); // Rozamiento que se aplica

        Cliente cliente = new Cliente(gestor); // Añadimos al cliente el gestor de filtros

        // Creamos las hebras pasandole un objeto Mandos (JFrame) y pasandole el cliente
        // y el salpicadero
        Thread hebra = new Thread(new Mandos(cliente, salpicadero));
        hebra.start();
    }
}
