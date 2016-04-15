/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DbTable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author parth
 */
public class CustomerlistController extends AbstractController {
    
    public CustomerlistController() {
    }
    
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ApplicationContext  context = new ClassPathXmlApplicationContext("Beans.xml");
        DbTable customerMng = (DbTable) context.getBean("DbTable");
        ModelAndView model = new ModelAndView("Viewcustomer");
        model.addObject("list", customerMng.getCustomer());
       
      
        return model;
    }
    
}
