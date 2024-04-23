/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dbms;

import com.mycompany.dbms.dao.UsersDAO;
import com.mycompany.dbms.data.Addfunds;
import com.mycompany.dbms.data.Addsales;
import com.mycompany.dbms.data.Empdata;
import com.mycompany.dbms.data.Employee;
import com.mycompany.dbms.data.EmployeeProj;
import com.mycompany.dbms.data.ExtraExpenseAdd;
import com.mycompany.dbms.data.Project;
import com.mycompany.dbms.data.Userdata;
import jakarta.security.enterprise.authentication.mechanism.http.openid.OpenIdConstant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.ObjectStreamConstants;
import java.sql.SQLException;
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
        String uri = request.getRequestURI();
        String username = request.getParameter("user");
        request.setAttribute("usern", username);
        ArrayList<Userdata> a = new ArrayList<>();
        a.add(new Userdata(12, "y", "y@y"));
        a.add(new Userdata(12, "a", "a@a"));
        a.add(new Userdata(12, "s", "s@s"));
        a.add(new Userdata(12, "t", "t@t"));
        request.setAttribute("a", a);
        if (uri.equals("/")) {
            request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
        } else if (uri.equals("/empsal")) {
            request.getRequestDispatcher("/WEB-INF/pages/empsal.jsp").forward(request, response);
        }
        if (uri.equals("/empproj")) {
            request.getRequestDispatcher("/WEB-INF/pages/empproj.jsp").forward(request, response);
        }/* String Method=request.getMethod();
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
        }*/ else if (uri.equals("/admin")) {
            request.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(request, response);
        } else if (uri.equals("/newuser")) {

            String Method = request.getMethod();
            System.out.println(Method);
            if (Method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/new_user.jsp").forward(request, response);
            } else if (Method.equals("POST")) {
                String employeeID = request.getParameter("EmployeeID");
                String employeeName = request.getParameter("EmployeeName");
                String employeeRole = request.getParameter("EmployeeRole");
                String phoneNumber = request.getParameter("PhoneNumber");
                String salary = request.getParameter("Salary");
                String username1 = request.getParameter("Username");
                String password = request.getParameter("Password");
                Empdata e = new Empdata(Integer.parseInt(employeeID), employeeName, employeeRole, phoneNumber, Float.parseFloat(salary), username1, password);
                int l = UsersDAO.getInstance().save(e);
                if (l == 1) {
                    response.sendRedirect("/admin");
                } else {
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Registration Failed (Employee ID or username already taken. Please try again.');");
                    out.println("window.location.href='/newuser';");
                    out.println("</script>");
                }
            }
        } else if (uri.equals("/login")) {
            String method = request.getMethod();
            System.out.println(method);
            if (method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            } else {
                String user = request.getParameter("username");
                String password = request.getParameter("password");
                System.out.println(user + password);
                Map<String, String> userData = UsersDAO.getInstance().getdata(user, password);
                if (userData != null) {
                    // Set username in session
                    request.getSession().setAttribute("username", user);

                    // Forward to main.jsp
                    List<Map<String, String>> projects = UsersDAO.getInstance().checkProject(user);
                    request.setAttribute("data", userData);
                    request.setAttribute("projects", projects);
                    request.getRequestDispatcher("/WEB-INF/pages/main.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password");
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                }
            }
        } else if (uri.equals("/adminlog")) {
            String method = request.getMethod();
            System.out.println(method);

            if (method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/user_login.jsp").forward(request, response);
            } else if (method.equals("POST")) {
                String user = request.getParameter("u");
                String password = request.getParameter("p");
                System.out.println(user + password);

                Map<String, String> userData = UsersDAO.getInstance().admindata(user, password);
                if (userData != null && !userData.isEmpty()) {
                    request.getSession().setAttribute("userData", userData); // Storing user data in session for later use
                    request.getRequestDispatcher("/admin").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password");
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                }
            }
        } else if (uri.equals("/addempproj")) {
            String Method = request.getMethod();
            System.out.println(Method);
            if (Method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/empprojnew.jsp").forward(request, response);
            } else if (Method.equals("POST")) {
                System.out.println("abc");
                String pname = request.getParameter("pname");
                float timeperiod = Float.parseFloat(request.getParameter("timeperiod"));
                String status = request.getParameter("status");
                float expenses = Float.parseFloat(request.getParameter("expenses"));
                String description = request.getParameter("description");

                Project project = new Project(pname, timeperiod, status, expenses, description);
                UsersDAO usersDAO = UsersDAO.getInstance();
                int result = usersDAO.saveproj(project);
                if (result == 1) {
                    response.sendRedirect("/admin?success=true");
                } else {
                    request.setAttribute("errorMessage", "Error in data sending");
                }
            }
        } 
        else if (uri.equals("/logout")) {
            request.getSession().invalidate();
            response.sendRedirect("/");
        }else if (uri.equals("/addfunds")) {
            String method = request.getMethod();
            System.out.println(method);
            if (method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/addfunds.jsp").forward(request, response);
            } else if (method.equals("POST")) {
                String transactionID = request.getParameter("transactionID");
                String InvestorName = request.getParameter("InvestorName");
                int amount = Integer.parseInt(request.getParameter("amount"));

                Addfunds fund = new Addfunds(transactionID, InvestorName, amount);
                UsersDAO usersDAO = UsersDAO.getInstance();
                int result = usersDAO.addextra(fund);
                if (result == 1) {
                    response.sendRedirect("/admin?success=true");
                } else {
                    request.setAttribute("errorMessage", "Error in data sending");
                    request.getRequestDispatcher("/admin").forward(request, response);
                }
            }
        } else if (uri.equals("/UpdateProjEmployee")) {
            // Handle update employee logic here
            request.getRequestDispatcher("/WEB-INF/pages/projemp.jsp").forward(request, response);
            String projectId = request.getParameter("projectId");
            int numEmployees = Integer.parseInt(request.getParameter("numEmployees"));

            List<EmployeeProj> employees = new ArrayList<>();
            for (int i = 0; i < numEmployees; i++) {
                String employeeId = request.getParameter("employeeId_" + i);
                employees.add(new EmployeeProj(employeeId));
            }
            System.out.println(employees);
            UsersDAO usersDAO = UsersDAO.getInstance();
            int rowsAffected = usersDAO.saveEmployees(projectId, employees);

            if (rowsAffected > 0) {
                response.getWriter().println("Employees added successfully!");
            } else {
                response.getWriter().println("Failed to add employees.");
            }
        } else if (uri.equals("/UpdateEmployee")) {
            String method = request.getMethod();
            System.out.println(method);
            if (method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/updateemployee.jsp").forward(request, response);
            } else if (method.equals("POST")) {
                int empID = Integer.parseInt(request.getParameter("empID"));
                String empRole = request.getParameter("empRole");
                String phone = request.getParameter("phone");
                double salary = Double.parseDouble(request.getParameter("salary"));
                UsersDAO usersDAO = UsersDAO.getInstance(); // Redirect to error page
                usersDAO.updateEmployee(empID, empRole, phone, salary);
                response.sendRedirect("/admin");
            }
        } else if (uri.equals("/UpdateProjectStatus")) {
            String method = request.getMethod();
            if (method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/updateprojectstatus.jsp").forward(request, response);
            } else if (method.equals("POST")) {
                String projectID = request.getParameter("projectID");
                String newStatus = request.getParameter("newStatus");

                try {
                    UsersDAO usersDAO = UsersDAO.getInstance();
                    System.out.println(projectID + newStatus);
                    String resultMessage = usersDAO.updateProjectStatus(projectID, newStatus);
                    request.setAttribute("resultMessage", resultMessage);
                    request.getRequestDispatcher("/WEB-INF/pages/updateprojectstatus.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("/error.jsp");
                }
            }
        } else if (uri.equals("/addextraexpense")) {

            String method = request.getMethod();
            System.out.println(method);
            if (method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/extraexpenseadd.jsp").forward(request, response);
            } else if (method.equals("POST")) {
                String purpose = request.getParameter("purpose");
                int amount = Integer.parseInt(request.getParameter("amount"));
                ExtraExpenseAdd expenseAdd = new ExtraExpenseAdd(purpose, amount);
                UsersDAO usersDAO = UsersDAO.getInstance();
                int result = usersDAO.addextra(expenseAdd);
                if (result == 1) {
                    response.sendRedirect("/admin?success=true");
                } else {
                    request.setAttribute("errorMessage", "Error in data sending");
                    request.getRequestDispatcher("/admin").forward(request, response);
                }

            }
        } else if (uri.equals("/showEmployees")) {

            UsersDAO usersDAO = UsersDAO.getInstance();
            List<Map<String, String>> employees = usersDAO.getAllEmployees();

            request.setAttribute("employees", employees);
            request.getRequestDispatcher("/WEB-INF/pages/showemployees.jsp").forward(request, response);
            //System.out.println("abc");
            // System.out.println(employees);
            //   System.out.println("abc");
        }
        if (uri.equals("/deleteEmployee") && request.getMethod().equalsIgnoreCase("POST")) {

            String employeeIDStr = request.getParameter("employeeID");
            if (employeeIDStr != null && !employeeIDStr.isEmpty()) {
                int employeeID = Integer.parseInt(employeeIDStr);
                UsersDAO usersDAO = UsersDAO.getInstance();
                usersDAO.deleteEmployee(employeeID);
                response.sendRedirect("/showEmployees?success=true");
            }
        } else if (uri.equals("/addsale")) {
            String method = request.getMethod();
            System.out.println(method);
            if (method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/pages/addsale.jsp").forward(request, response);
            } else if (method.equals("POST")) {
                String saleID = request.getParameter("saleID");
                String projectID = request.getParameter("projectID");
                int profit = Integer.parseInt(request.getParameter("profit"));

                UsersDAO usersDAO = UsersDAO.getInstance();

                // Check if saleID already exists
                if (usersDAO.isSaleIDExists(saleID)) {
                    // If saleID already exists, display error message
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sale ID already exists. Please choose a different one.');");
                    out.println("window.location.href='/admin';");
                    out.println("</script>");
                } else {
                    // Sale ID does not exist, proceed with insertion
                    Addsales sale = new Addsales(saleID, projectID, profit);
                    int result = usersDAO.addNewSale(sale);
                    if (result == 1) {
                        response.sendRedirect("/admin?success=true");
                    } else {
                        request.setAttribute("errorMessage", "Error in data sending");
                        request.getRequestDispatcher("/admin").forward(request, response);
                    }
                }
            }
        }

        

        
        else if (uri.equals("/netexpense")) {
            // Add your code here for handling "/netexpense" URI
            // This block will execute if the URI is "/netexpense"
            UsersDAO usersDAO = UsersDAO.getInstance();
        
            List<Map<String, String>> employeesData = usersDAO.expenseEmployees();
            List<Map<String, String>> extraExpenseData = usersDAO.expenseExtra();
            List<Map<String, String>> projectData = usersDAO.expenseProjects();
            List<Map<String, String>> salesData = usersDAO.expensesales();
            List<Map<String, String>> fundsData = usersDAO.expensefunds();
            List<Map<String, String>> marketingData = usersDAO.expensemarketing();
            
            Map<String, Double> subtotals = UsersDAO.executeAndStoreSubtotals();
            String result = usersDAO.calculateNetProfitLoss();

            request.setAttribute("employeesData", employeesData);
            request.setAttribute("extraExpenseData", extraExpenseData);
            request.setAttribute("projectData", projectData);
            request.setAttribute("salesData", salesData);
            request.setAttribute("fundsData", fundsData);
            request.setAttribute("marketingData", marketingData);
            request.setAttribute("subtotals", subtotals);
            request.setAttribute("result", result);
            request.getRequestDispatcher("/WEB-INF/pages/expense.jsp").forward(request, response);
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
