/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.controllers.general;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tupt.dtos.HouseDTO;

/**
 *
 * @author sherl
 */
@WebServlet(name = "CalculateController", urlPatterns = {"/CalculateController"})
public class CalculateController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        try {
            int numOfFloors = Integer.parseInt(request.getParameter("numOfFloors"));
            int areaOfFloor = Integer.parseInt(request.getParameter("areaOfFloor"));
            String substructure = request.getParameter("substructure");
            String typeOfWall = request.getParameter("typeOfWall");
            String typeOfCeiling = request.getParameter("typeOfCeiling");
            
            String roof = request.getParameter("roof");
            
            String simpleTerrace = request.getParameter("simpleTerrace");
            String areaOfTum = request.getParameter("areaOfTum");
            String areaOfFlower = request.getParameter("areaOfFlower");
            String areaOfLam = request.getParameter("areaOfLam");
            String areaOfCover = request.getParameter("areaOfCover");
            String areaOfNoCover = request.getParameter("areaOfNoCover");
            
            HouseDTO dto = new HouseDTO(numOfFloors, areaOfFloor, substructure, typeOfWall, roof, simpleTerrace != null,
                    areaOfTum.equals("") ? 0 : Integer.parseInt(areaOfTum), areaOfFlower.equals("") ? 0 : Integer.parseInt(areaOfFlower),
                    areaOfLam.equals("") ? 0 : Integer.parseInt(areaOfLam), areaOfCover.equals("") ? 0 : Integer.parseInt(areaOfCover),
                    areaOfNoCover.equals("") ? 0 : Integer.parseInt(areaOfNoCover));
            double totalConstructionArea = dto.totalConstructionArea();
            String quality = request.getParameter("quality");
            
            System.out.println("total area: " + totalConstructionArea);
            System.out.println("wall: " + dto.wallArea());
            System.out.println("cement: " + dto.cementMass());
            System.out.println("rock: " + dto.rockVolume());
            System.out.println("sand: " + dto.sandVolume());
            System.out.println("steel: " + dto.steelMass());
            System.out.println("bricks: " + dto.numberOfBricks());
            System.out.println("tiles: " + dto.numberOfTiles());
            
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
