/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DbTable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author sanjay prajapati
 */
public class LoginController extends AbstractController {
    
    public LoginController() {
    }
    
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
        DbTable dbtable = (DbTable) context.getBean("DbTable");
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        if(request.getParameter("username") == null || request.getParameter("password") == null){
            session.setAttribute("error", "Supplied credential is invalid.");
            mav.setViewName("loginerror");
            return mav;
        }
        boolean status = dbtable.authenticate(request.getParameter("username"), request.getParameter("password"));
        if(status){
            mav.setViewName("dashboard");
        }else{
            session.setAttribute("error", "Supplied credential is invalid.");
            mav.setViewName("loginerror");
        }
        return mav;
    }
    
}
