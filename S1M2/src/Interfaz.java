/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author andres
 */
public class Interfaz extends javax.swing.JFrame{
    public Interfaz(javax.swing.JPanel panel, String e){
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        add(panel);
        setTitle(e);
        pack();
        setVisible(true);
    }
}
