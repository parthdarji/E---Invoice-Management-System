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
public class EditCustomerControlle extends AbstractController {
    
    public EditCustomerControlle() {
    }
    
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
       String customer_id = request.getParameter("customer_id");
        String customer_name = request.getParameter("customername");
        String customer_address = request.getParameter("customeraddress");
        System.out.println("Customer id:::::: " + customer_name);

        ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

        HttpSession session = request.getSession();

        DbTable Edit_customer = (DbTable) context.getBean("DbTable");
        DbTable customerMng = (DbTable) context.getBean("DbTable");

        Edit_customer.EditCustomer(customer_id, customer_name, customer_address);

        ModelAndView model = new ModelAndView("EditCustomer");

        session.setAttribute("successmsg", "Customer Detalils Updated Successfully");

        model.addObject("list", customerMng.getCustomer());
        return model;
    }
    
}
