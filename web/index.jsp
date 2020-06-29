<%@ page import="dataBase.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: MoGI
  Date: 04.06.2020
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    // флаг для отображения ошибки, что пользователь не найден.
    private boolean isExistCustomer = true;
%>
<%
    if (request.getMethod().equals("POST")) {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        if (login != null && password != null) {
            request.setAttribute("userName", login);
            Connection connection = DataBase.getConnection();
            if (connection != null) {
                Customer cust = CustomerDML.getExistCustomer(connection, login, password);
                if (cust == null) {
                    isExistCustomer = false;
                } else { //Mus josdvf
                    session.setAttribute("customer", cust);
                    request.getRequestDispatcher("/result.html").forward(request, response);
                }
            }
        }
    }
%>
<html>
<head>
    <title>Starting page</title>
    <%--    <link rel="stylesheet" type="text/css" href="style.css"/> Doesn't work--%>
    <style>
        <%@include file="style.css"%>
    </style>
</head>
<body>
<div class="topNavigation">
    <a href="index.jsp">Home</a>
    <div class="topNav-center">
        <h1>Take by self</h1>
    </div>
</div>
<div class="contentPanel">
    <form method="post">
        <%
            //1 выводим ошибку, что пользователь не найден средствамии css/jsp
            if (!isExistCustomer) {
        %>
        <div class="userDoesNotExist">
            <%}%>
            <table>
            <caption>Ауентификация</caption>
            <tbody>
            <%if (!isExistCustomer) {
            %>
            <tr class="redAlert">
                <td colspan="2">Логин и пароль не верны</td>
            </tr>
            <%}%>
            <tr>
                <th>Логин</th>
                <td><input type="text" name="login" required placeholder="Ввдеите логин"/></td>
            </tr>
            <tr>
                <th>Пароль</th>
                <td><input type="password" name="password" required placeholder="Ввдеите пароль"/></td>
            </tr>
            <tr>
                <td>&nbsp</td>
                <td colspan="2"><input type="submit" value="Вход"/></td>
            </tr>
            </tbody>
        </table>
            <% //2 выводим ошибку, что пользователь не найден средствамии css/jsp
                if (!isExistCustomer) {
                    isExistCustomer=true;
            %>
        </div>
        <%}%>
    </form>
</div>
</body>
</html>
