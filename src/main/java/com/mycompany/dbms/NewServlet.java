/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dbms;

import com.mycompany.dbms.dao.UsersDAO;
import com.mycompany.dbms.data.Userdata;
import jakarta.security.enterprise.authentication.mechanism.http.openid.OpenIdConstant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.ObjectStreamConstants;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/**
 *
 * @author sandi
 */
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String uri=request.getRequestURI();
        String username=request.getParameter("user");
        request.setAttribute("usern",username);
        ArrayList<Userdata>a=new ArrayList<>();
        a.add(new Userdata(12, "y", "y@y"));
       a.add(new Userdata( 12, "a","a@a"));
       a.add(new Userdata( 12, "s","s@s"));
        a.add(new Userdata( 12,"t", "t@t"));
       request.setAttribute("a",a);
       if (uri.equals("/")){
            request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
        }
           /* String Method=request.getMethod();
            System.out.println(Method);
            if (Method.equals("GET")) {
            
           request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
            }
            else{
                String user=request.getParameter("name");
                int age=Integer.parseInt(request.getParameter("age"));
                String email=request.getParameter("email");
                UsersDAO.getInstance().save(new Userdata(age,user,email));
                  UsersDAO.getInstance().getdata(email,user);
            }
        }*/
         
        else if (uri.equals("/projects")){
            request.getRequestDispatcher("/WEB-INF/pages/projects.jsp").forward(request, response);
        }
        else if(uri.equals("/login")){
            String method=request.getMethod();
            System.out.println(method);
            if (method.equals("GET")) {
            
           request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            }
            else{
                String user=request.getParameter("username");
                String password=request.getParameter("password");
                System.out.println(user+password);
                Map<String, String> n=UsersDAO.getInstance().getdata(user,password);
               

                
                if (n!=null){
                    request.setAttribute("data", n);
                    List<Map<String, String>> projects = UsersDAO.getInstance().checkProject(user); 
                    request.setAttribute("projects", projects);
                    
                    request.getRequestDispatcher("/WEB-INF/pages/main.jsp").forward(request, response);
                }
                else{
                     request.setAttribute("errorMessage", "Invalid username or password");
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                }
                 
            }
        } 
         else if(uri.equals("/adminlog")){
            String method=request.getMethod();
            System.out.println(method);
           
            if (method.equals("GET")) {
            
           request.getRequestDispatcher("/WEB-INF/pages/user_login.jsp").forward(request, response);
            }
            else{
                String user=request.getParameter("u");
                String password=request.getParameter("p");
                System.out.println(user+password);
                int n=UsersDAO.getInstance().admindata(user,password);
                if (n==1){
                    request.getRequestDispatcher("/WEB-INF/pages/main.jsp").forward(request, response);
                }
                else{
                     request.setAttribute("errorMessage", "Invalid username or password");
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                }
            }
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
