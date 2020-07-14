/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.test;

/**
 *
 * @author sherl
 */
public class MainForTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int n = 5;
        int[] priceArr = {1290000, 1465000, 1490000, 1570000, 1570000};
        double Q1;
        double posOfQ1 = (n+1)/4.0;
        double afterDot = (((int) (posOfQ1*100))%100)/100.0;
        System.out.println(afterDot);
        int beforeDot = (int) (posOfQ1 - afterDot);
        Q1 = priceArr[beforeDot-1]*(1-afterDot) + priceArr[beforeDot]*afterDot;
        System.out.println(Q1);
    }
    
}
