<%-- 
    Document   : trabComDBusandoJSPeJDBC
    Created on : 29/06/2020, 22:03:27
    Author     : lukas
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trabalhando com Banco de Dados usando JDBC e JSP</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>ISBN</th><th>Titulo</th>
                    <th>Excluir</th><th>Atualizar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement st = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livraria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC", "root", "");
                        st = conn.createStatement();
                        rs = st.executeQuery("select isbn, titulo from livros");
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("isbn")%></td>
                    <td><%= rs.getString("titulo")%></td>
                    <td>
                        <a href="excluindoDB.jsp?isbn=<%= rs.getString("isbn") %>" >
                        Clique aqui
                        </a>
                    </td>
                    <td>
                        <a href="atDB.jsp?isbn=<%= rs.getString("isbn") %>" >
                        Clique aqui
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (st != null) {
                            st.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
