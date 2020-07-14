/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.dtos;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author sherl
 */
public class StatisticDTO implements Serializable {

    private List<Product> dataSet;
    private int priceArr[];
    private double Q1, Q3;

    public StatisticDTO() {
    }

    public StatisticDTO(List<Product> dataSet) {
        this.dataSet = dataSet;

        // Lấy giá tiền của tất cả sản phẩm đưa vào mảng
        this.priceArr = new int[dataSet.size()];
        for (int i = 0; i < dataSet.size(); i++) {
            priceArr[i] = dataSet.get(i).getPrice();
        }
        Arrays.sort(priceArr);
        switch (priceArr.length) {
            case 0: {
                Q1 = 0;
                Q3 = 0;
                break;
            }
            case 1: {
                Q1 = priceArr[0];
                Q3 = priceArr[0];
                break;
            }
            case 2: {
                Q1 = priceArr[0];
                Q3 = priceArr[1];
                break;
            }
            case 3: {
                Q1 = priceArr[0];
                Q3 = priceArr[2];
                break;
            }
            default: {
                calculateQ1();
                calculateQ3();
            }
        }
    }

    // Tính toán phân khúc giá
    public void calculateQ1() {
        int n = priceArr.length;
        double posOfQ1 = (n + 1) / 4.0;
        double afterDot = (((int) (posOfQ1 * 100)) % 100) / 100.0;
        int beforeDot = (int) (posOfQ1 - afterDot);
        Q1 = priceArr[beforeDot - 1] * (1 - afterDot) + priceArr[beforeDot] * afterDot;

    }

    public void calculateQ3() {
        int n = priceArr.length;
        double posOfQ3 = 3 * (n + 1) / 4;
        double afterDot = (((int) posOfQ3 * 100) % 100) / 100;
        int beforeDot = (int) (posOfQ3 - afterDot);
        Q3 = priceArr[beforeDot - 1] * (1 - afterDot) + priceArr[beforeDot] * afterDot;

    }

    public List<Product> getDataSet() {
        return dataSet;
    }

    public void setDataSet(List<Product> dataSet) {
        this.dataSet = dataSet;
    }

    public int[] getPriceArr() {
        return priceArr;
    }

    public void setPriceArr(int[] priceArr) {
        this.priceArr = priceArr;
    }

    public double getQ1() {
        return Q1;
    }

    public void setQ1(double Q1) {
        this.Q1 = Q1;
    }

    public double getQ3() {
        return Q3;
    }

    public void setQ3(double Q3) {
        this.Q3 = Q3;
    }

}
