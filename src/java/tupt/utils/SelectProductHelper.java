/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Response;
import tupt.clients.ProductClient;
import tupt.constants.HouseConstant;
import tupt.dtos.Product;
import tupt.dtos.StatisticDTO;

/**
 *
 * @author sherl
 */
public class SelectProductHelper implements Serializable {

    private List<Product> selectedProducts;
    private String quality;

    public SelectProductHelper(String quality) {
        selectedProducts = new ArrayList<>();
        this.quality = quality;
    }

    public List<Product> getListProduct() {
        ProductClient productClient = new ProductClient();

        List<Product> cementList = productClient.findCement(Product.class);
        StatisticDTO cementStatistic = new StatisticDTO(cementList);
        System.out.println("cement: " + cementList.size());

        List<Product> rockList = productClient.findRock(Product.class);
        StatisticDTO rockStatistic = new StatisticDTO(rockList);
        System.out.println("rock: " + rockList.size());

        List<Product> sandList = productClient.findSand(Product.class);
        StatisticDTO sandStatistic = new StatisticDTO(sandList);
        System.out.println("sand: " + sandList.size());

        List<Product> steelList = productClient.findSteel(Product.class);
        StatisticDTO steelStatistic = new StatisticDTO(steelList);
        System.out.println("steel: " + steelList.size());

        List<Product> brickList = productClient.findBrick(Product.class);
        StatisticDTO brickStatistic = new StatisticDTO(brickList);
        System.out.println("bricks: " + brickList.size());

        List<Product> tileList = productClient.findTile(Product.class);
        StatisticDTO tileStatistic = new StatisticDTO(tileList);
        System.out.println("tiles: " + tileList.size());

        switch (quality) {
            case HouseConstant.LOW_QUALITY: {
                // chọn xi măng
                for (Product product : cementList) {
                    if (product.getPrice() <= cementStatistic.getQ1()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn đá xây dựng
                for (Product product : rockList) {
                    if (product.getPrice() <= rockStatistic.getQ1()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn cát vàng
                for (Product product : sandList) {
                    if (product.getPrice() <= sandStatistic.getQ1()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn sắt thép
                for (Product product : steelList) {
                    if (product.getPrice() <= steelStatistic.getQ1()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn gạch xây tường
                for (Product product : brickList) {
                    if (product.getPrice() <= brickStatistic.getQ1()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn ngói lợp
                for (Product product : tileList) {
                    if (product.getPrice() <= tileStatistic.getQ1()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                break;
            }
            case HouseConstant.MEDIUM_QUALITY: {
                // chọn xi măng
                for (Product product : cementList) {
                    if (product.getPrice() >= cementStatistic.getQ1() && product.getPrice() <= cementStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn đá xây dựng
                for (Product product : rockList) {
                    if (product.getPrice() >= rockStatistic.getQ1() && product.getPrice() <= rockStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn cát vàng
                for (Product product : sandList) {
                    if (product.getPrice() >= sandStatistic.getQ1() && product.getPrice() <= sandStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn sắt thép
                for (Product product : steelList) {
                    if (product.getPrice() >= steelStatistic.getQ1() && product.getPrice() <= steelStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn gạch xây tường
                for (Product product : brickList) {
                    if (product.getPrice() >= brickStatistic.getQ1() && product.getPrice() <= brickStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn ngói lợp
                for (Product product : tileList) {
                    if (product.getPrice() >= tileStatistic.getQ1() && product.getPrice() <= tileStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                break;
            }
            case HouseConstant.HIGH_QUALITY: {
                // chọn xi măng
                for (Product product : cementList) {
                    if (product.getPrice() >= cementStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn đá xây dựng
                for (Product product : rockList) {
                    if (product.getPrice() >= rockStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn cát vàng
                for (Product product : sandList) {
                    if (product.getPrice() >= sandStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn sắt thép
                for (Product product : steelList) {
                    if (product.getPrice() >= steelStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn gạch xây tường
                for (Product product : brickList) {
                    if (product.getPrice() >= brickStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                // chọn ngói lợp
                for (Product product : tileList) {
                    if (product.getPrice() >= tileStatistic.getQ3()) {
                        selectedProducts.add(product);
                        break;
                    }
                }
                break;
            }
        }
        return selectedProducts;
    }
}
