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
public class DeleteCustomerController extends AbstractController {
    
    public DeleteCustomerController() {
    }
    
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String customer_id = request.getParameter("id");
        System.out.println("Prdouct id: " + customer_id);

        ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

        HttpSession session = request.getSession();
        session.setAttribute("successmsg", "Customer Deleted Successfully");

        DbTable Delete_customer = (DbTable) context.getBean("DbTable");
        DbTable customerMng = (DbTable) context.getBean("DbTable");

        Delete_customer.DeleteCustomer(customer_id);

        ModelAndView model = new ModelAndView("ListCustomer");
        model.addObject("list", customerMng.getCustomer());
        return model;
    }
    
}
