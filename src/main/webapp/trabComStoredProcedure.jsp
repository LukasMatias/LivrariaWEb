<%-- 
    Document   : trabalhandoComStoredProcedure
    Created on : 30/06/2020, 18:12:23
    Author     : lukas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trabalhando com Stored Procedure</title>
    </head>
    <body>
        <form action="trabComStoredProcedure.jsp" >
            ISBN: <input type="text" name="isbn">
            <input type="submit" name="btEnviar" value="Pesquisar">
        </form>
        <%
            String isbn = request.getParameter("isbn");

            Connection conn = null;
            ResultSet rs = null;
            CallableStatement cStatement = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livraria?"
                        + "useUnicode=yes&"
                        + "characterEncoding=UTF-8&"
                        + "useTimezone=true&"
                        + "serverTimezone=UTC", "root", "");

                cStatement = conn.prepareCall("{CALL sp_m_liv_isbn(?)}");

                cStatement.setString(1, isbn);
                rs = cStatement.executeQuery();

                if (rs.next()) {
        %>
        <table border="1">
            <tr>
                <th>ISBN</th><th>Título</th>
            </tr>
            <%
                do {
            %>
            <tr>
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>
            </tr>
            <%
                } while (rs.next());
            %>
        </table>
        <% } else {
                    out.print("Livro não encontrado!");
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                if (conn != null) {
                    conn.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (cStatement != null) {
                    cStatement.close();
                }
            }
        %>
    </body>
</html>
