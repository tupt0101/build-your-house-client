/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.controllers.general;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tupt.clients.ProductClient;
import tupt.clients.TagAnswerClient;
import tupt.clients.TagClient;
import tupt.constants.HouseConstant;
import tupt.dtos.Product;
import tupt.dtos.StatisticDTO;
import tupt.dtos.Tag;
import tupt.dtos.TagAnswer;
import tupt.utils.FengShuiHelper;

/**
 *
 * @author sherl
 */
@WebServlet(name = "SuggestController", urlPatterns = {"/suggest"})
public class SuggestController extends HttpServlet {

    private static final String SUCCESS = "suggest.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            TagClient tagClient = new TagClient();
            TagAnswerClient tagAnswerClient = new TagAnswerClient();
            ProductClient productClient = new ProductClient();

            String ansOfQues1 = request.getParameter("ansOfQues1");
            String ansOfQues2 = request.getParameter("ansOfQues2");
            String ansOfQues3 = request.getParameter("ansOfQues3");
            String ansOfQues4 = request.getParameter("ansOfQues4");
            String yob = request.getParameter("yearOfBirth");
            String fate = FengShuiHelper.findFateFromYOB(Integer.parseInt(yob));

            int[] ansIDArr = {Integer.parseInt(ansOfQues1), Integer.parseInt(ansOfQues2), Integer.parseInt(ansOfQues3), Integer.parseInt(ansOfQues4)};
            List<String> tagList = new ArrayList<>();
            List<Tag> tagListFromDB = tagClient.findAll_XML();
            List<TagAnswer> tagAnswerListFromDB = tagAnswerClient.findAll_XML();
            for (int i = 0; i < ansIDArr.length; i++) {
                for (TagAnswer tagAnswer : tagAnswerListFromDB) {
                    if (tagAnswer.getAnswerID().getId() == ansIDArr[i]) {
                        for (Tag tag : tagListFromDB) {
                            if (tagAnswer.getTagID().getId() == tag.getId()) {
                                tagList.add(tag.getName());
                            }
                        }
                    }
                }
            }
            System.out.println("tag: " + tagList.get(0) + " " + tagList.get(1) + " " + tagList.get(2) + " " + tagList.get(3) + " " + fate);
            List<Product> listProductFromDB = productClient.findProductByTag(Product.class, tagList.get(0), tagList.get(1), tagList.get(2), tagList.get(3), fate);
            System.out.println("listFromDB: " + listProductFromDB.size());

            String quality = request.getParameter("quality");

            Comparator<Product> comparatorByPrice = (Product p1, Product p2) -> p1.getPrice() - p2.getPrice();
            Collections.sort(listProductFromDB, comparatorByPrice);
            
            StatisticDTO statisticDTO = new StatisticDTO(listProductFromDB);

            List<Product> result = new ArrayList<>();
            switch (quality) {
                case HouseConstant.LOW_QUALITY: {
                    for (Product product : listProductFromDB) {
                        if (product.getPrice() <= statisticDTO.getQ1())
                            result.add(product);
                    }
                    break;
                }
                case HouseConstant.MEDIUM_QUALITY: {
                    for (Product product : listProductFromDB) {
                        if (product.getPrice() >= statisticDTO.getQ1() && product.getPrice() <= statisticDTO.getQ3())
                            result.add(product);
                    }
                    break;
                }
                case HouseConstant.HIGH_QUALITY: {
                    for (Product product : listProductFromDB) {
                        if (product.getPrice() >= statisticDTO.getQ3())
                            result.add(product);
                    }
                    break;
                }
            }

            request.setAttribute("RESULT", result);
            System.out.println("result: " + result.size());
            url = SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
