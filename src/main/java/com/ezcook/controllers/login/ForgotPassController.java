package com.ezcook.controllers.login;

import com.ezcook.daos.impls.UserDao;
import com.ezcook.entities.Email;
import com.ezcook.entities.User;
import com.ezcook.utils.EmailUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login/forgotpass"})
public class ForgotPassController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String host;
    private String port;
    private String socketFactoryClass;
    private String auth;
    private String email;
    private String name;
    private String pass;

    public void init(ServletConfig config) {
        // reads SMTP server setting from web.xml file
        ServletContext context = config.getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        socketFactoryClass = context.getInitParameter("socketFactoryClass");
        auth = context.getInitParameter("auth");
        email = context.getInitParameter("email");
        name = context.getInitParameter("name");
        pass = context.getInitParameter("pass");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws SecurityException, IOException, ServletException {
        checkMessage(request);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/forgotPass.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String emailAddress = request.getParameter("email");
            String username = request.getParameter("username");

            UserDao userDao = new UserDao();
            User user = userDao.findByUsernameAndEmail(username, emailAddress);
            checkMessage(request);
            if (user == null) {
                response.sendRedirect("/login/forgotpass?message=fail");
                //request.setAttribute("message", "T??i kho???n ho???c email kh??ng ????ng");
            } else {
                Email email = new Email();
                email.setFrom("lethingocdiemxt2001@gmail.com");
                email.setFromPassword("138200113tdt");
                email.setTo(emailAddress);
                email.setSubject("Forgot Password");
                StringBuilder sb = new StringBuilder();
                sb.append("Th??n ch??o ").append(username).append("<br>");
                sb.append("B???n v???a g???i y??u c???u nh???n l???i m???t kh???u cho t??i kho???n tr??n Ezcook. <br>");
                sb.append("M???t kh???u c???a b???n l?? <b>").append(user.getPassword()).append("</b>");
                sb.append("Tr??n tr???ng!");
                sb.append("Ban qu???n l?? Ezcook");

                email.setContent(sb.toString());
                EmailUtil.send(email);
                response.sendRedirect("/login/forgotpass?message=suss");
               // request.setAttribute("message", "???? g???i ?????n ?????a ch??? email c???a b???n. Vui l??ng ki???m tra l???i. C???m ??n");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
        }
       // response.sendRedirect("/login/forgotpass");
    }
    public void checkMessage(HttpServletRequest request) {
        String message = request.getParameter("message");
        if(message != null) {
            if(message.trim().equals("suss")) {
                request.setAttribute("message","???? g???i ?????n ?????a ch??? email c???a b???n. Vui l??ng ki???m tra l???i. C???m ??n");
            } else if (message.trim().equals("fail")){
                request.setAttribute("message","T??i kho???n ho???c email kh??ng ????ng");
            }
        }
    }
}
