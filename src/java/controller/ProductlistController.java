/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DbTable;
import model.product;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author parth
 */
public class ProductlistController extends AbstractController {
    
     protected ModelAndView handleRequestInternal(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
       
	ApplicationContext  context = new ClassPathXmlApplicationContext("Beans.xml");
        DbTable productMng = (DbTable) context.getBean("DbTable");
        ModelAndView model = new ModelAndView("Viewproduct");
        model.addObject("list", productMng.getProduct());
       
        return model;
  }
}
