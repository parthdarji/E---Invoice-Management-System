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
public class DeleteProductController extends AbstractController {

    public DeleteProductController() {
    }

    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String product_id = request.getParameter("id");
        System.out.println("Prdouct id: " + product_id);

        ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

        HttpSession session = request.getSession();
        session.setAttribute("successmsg", "Product Deleted Successfully");

        DbTable Delete_product = (DbTable) context.getBean("DbTable");
        DbTable productMng = (DbTable) context.getBean("DbTable");

        Delete_product.DeleteProduct(product_id);

        ModelAndView model = new ModelAndView("ListProduct");
        model.addObject("list", productMng.getProduct());
        return model;
    }

}
