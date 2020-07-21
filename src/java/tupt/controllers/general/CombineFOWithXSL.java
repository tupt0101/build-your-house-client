/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.controllers.general;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/**
 *
 * @author sherl
 */
@WebServlet(name = "CombineFOWithXSL", urlPatterns = {"/generate-pdf"})
public class CombineFOWithXSL extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String realPath = getServletContext().getRealPath("/");
            String xslPath = realPath + "";
            String xmlPath = realPath + "";
            String foPath = realPath + "";
            methodTrAX(xslPath, xmlPath, foPath, realPath);
            File file = new File(foPath);
            FileInputStream input = new FileInputStream(file);

            ByteArrayOutputStream out = new ByteArrayOutputStream();
            response.setContentType("application/pdf");

//            FopFactory ff = FopFactory.newInstance();
//            FOUserAgent fua = ff.newFOUserAgent();
//            
//            Fop fop = ff.newFop(MimeConstants.MIME_PDF, fua, out);

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            File fo = new File(foPath);
            Source source = new StreamSource(fo);
//            Result result = new SAXResult(fop.getDefaultHandler());
//            transformer.transform(source, result);

            byte[] content = out.toByteArray();
            response.setContentLength(content.length);
            response.getOutputStream().write(content);
            response.getOutputStream().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void methodTrAX(String xslPath, String xmlPath, String output, String path) {
        try {
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            StreamSource xslFile = new StreamSource(xslPath);
            Transformer transformer = transformerFactory.newTransformer(xslFile);

            StreamSource xmlFile = new StreamSource(xmlPath);
            StreamResult htmlFile = new StreamResult(new FileOutputStream(output));
            transformer.transform(xmlFile, htmlFile);
        } catch (Exception e) {
            e.printStackTrace();
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
