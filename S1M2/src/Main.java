/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author andres
 */

public class Main {
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        Salpicadero s = new Salpicadero(0.3); // Radio de las ruedas
        GestorFiltros gestor = new GestorFiltros(s); // Añadimos al GestorFiltros el Salpicadero recien creado
        gestor.addFilter(new CalcularVelocidad(10000)); // Revoluciones maximas
        gestor.addFilter(new RepercutirRozamiento(-84)); // Rozamiento que se aplica

        Cliente c = new Cliente(gestor); // Añadimos al cliente el gestor de filtros

        // Nimbus look and feel
/*        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Mandos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Mandos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Mandos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Mandos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        // </editor-fold>
*/
        // Creamos las hebras pasandole un objeto Mandos (JFrame) y pasandole el cliente
        // y el salpicadero
        Thread hebra = new Thread(new Mandos(c, s));
        hebra.start();
    }
}
