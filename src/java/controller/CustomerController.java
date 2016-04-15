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
 * @author parth
 */
public class CustomerController extends AbstractController {
    
    public CustomerController() {
    }
    
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
        DbTable customer = (DbTable) context.getBean("DbTable");
        ModelAndView model = new ModelAndView("Addcustomer");
        HttpSession session = request.getSession();

        String customer_name = request.getParameter("customername");
        String customer_address = request.getParameter("address");

        if (customer_name == null || customer_address == null) {

            return model;
        } else {
            customer.insertcustomer(customer_name, customer_address);
            session.setAttribute("successmsg", "Customer Added Successfully");
            return model;
        }
    }
    
}
