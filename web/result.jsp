<%@ page import="model.Customer" %>
<%@ page import="model.Order" %>
<%@ page import="model.Item" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: MoGI
  Date: 04.06.2020
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <style>
        <%@include file="style.css"%>
    </style>
</head>
<%
    Customer cust = (Customer) session.getAttribute("customer");
%>
<body>
<div class="topNavigation">
    <a href="index.jsp">Home</a>
    <a href="result.xml">XML</a>
    <div class="topNav-center">
        <h1>Take by self</h1>
    </div>
    <div class="topNav-right">
        <p><%
            out.print(cust == null ? "Sorry, Unknown" : "Hello, "+cust.getName());
        %></p>
    </div>
</div>
<div class="content">
    <%
        if (cust != null) {%>
    <div class="contentPanel">
        <table>
            <caption id="userDateLabel">Данные покупателя</caption>
            <tr>
                <th>Login:</th>
                <td><%=cust.getLogin()%>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td><%=cust.getName()%>
                </td>
            </tr>
            <tr>
                <th>Password:</th>
                <td><%=cust.getPassword()%>
                </td>
        </table>
    </div>
    <%
        if (cust.size() > 0) {
            for (Order order : cust) {//цикл по Order
    %>
    <div class="contentPanel">
        <table>
            <tr class="orderAddress">
                <th>Address:</th>
                <td><%=order.getAddress()%>
                </td>
            </tr>
            <%
                if (order.size() > 0) {
                    for (Item item : order) {
            %>
            <tr>
                <td class="separator" colspan="2"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><%=item.getName()%>
                </td>
            </tr>
            <tr>
                <td>Count:</td>
                <td><%=item.getCount()%>
                </td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><%=item.getPrice()%>
                </td>
            </tr>
            <tr>
                <td>Date of receipt:</td>
                <td><%=item.getDateOfReceipt()%>
                </td>
            </tr>
            <%
                    }//цикл по Товарам(Item)
                }
            %>
        </table>
    </div>
    <%
        }//цикл по Закакзам(Order)
    } else {
    %>
    <div class="contentPanel">
        <table>
            <caption>Заказов нет</caption>
        </table>
    </div>
    <%}%>
    <%} else {%>
    <div class="contentPanel">
        <table>
            <caption class="redAlert">Данных по пользователю нет</caption>
            <tr>
                <td>
                    <a href="index.jsp">Назад</a>
                </td>
            </tr>
        </table>
    </div>
    <%
        response.setHeader("Refresh","5;url=index.jsp");
        }
    %>
</div>
</body>
</html>
