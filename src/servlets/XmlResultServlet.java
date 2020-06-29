package servlets;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(name = "XmlResult", urlPatterns = "result.xml")
public class XmlResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer cust = (Customer) request.getSession().getAttribute("customer");
        response.setContentType("application/xml");

        try (PrintWriter writer = response.getWriter()) {
            JAXBContext context = JAXBContext.newInstance(Customer.class);
            Marshaller m = context.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);  //перевод строки
            m.marshal(cust, writer);

        } catch (JAXBException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
