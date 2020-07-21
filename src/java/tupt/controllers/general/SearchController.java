/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.controllers.general;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tupt.clients.ProductClient;
import tupt.dtos.Product;

/**
 *
 * @author sherl
 */
@WebServlet(name = "SearchController", urlPatterns = {"/result"})
public class SearchController extends HttpServlet {

    private static final String SUCCESS = "search.jsp";
    private static final String ERROR = "error.jsp";
    private static final int PER_PAGE = 30;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        try {
            String keyword = request.getParameter("keyword");
            String pageNumber = request.getParameter("pageNo");
            if (pageNumber == null) {
                pageNumber = "1";
            }
            
            int perpage = PER_PAGE;
            ProductClient productClient = new ProductClient();
            int totalRecord = productClient.findByLikeName(keyword).size();
            int totalPage = (int) Math.ceil((totalRecord*1.0) / perpage);
            
            List<Product> result = productClient.findByLikeNamePagination(keyword, Integer.parseInt(pageNumber), perpage);
            
            request.setAttribute("SEARCH_RESULT", result);
            request.setAttribute("TOTAL_PAGE", totalPage);
            request.setAttribute("KEYWORD", keyword);
            request.setAttribute("CURRENT_PAGE", Integer.parseInt(pageNumber));
            
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
