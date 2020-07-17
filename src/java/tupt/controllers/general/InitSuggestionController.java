/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.controllers.general;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tupt.clients.AnswerClient;
import tupt.clients.QuestionClient;
import tupt.dtos.Answer;
import tupt.dtos.QADTO;
import tupt.dtos.Question;

/**
 *
 * @author sherl
 */
@WebServlet(name = "InitSuggestionController", urlPatterns = {"/init-question"})
public class InitSuggestionController extends HttpServlet {

    private static final String SUCCESS = "suggest.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            QuestionClient questionClient = new QuestionClient();
            AnswerClient answerClient = new AnswerClient();
            
            List<Question> listQuestionFromDB = questionClient.findAll_XML();
            List<Answer> listAnswerFromDB = answerClient.findAll_XML();
            
            List<QADTO> qaList = new ArrayList<>();
            for (Question question : listQuestionFromDB) {
                List<Answer> ansOfQues = new ArrayList<>();
                for (Answer answer : listAnswerFromDB) {
                    if (question.getId() == answer.getQuestionID().getId()) {
                        ansOfQues.add(answer);
                    }
                }
                qaList.add(new QADTO(question, ansOfQues));
            }
            request.setAttribute("QA", qaList);
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
