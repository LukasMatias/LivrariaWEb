<%-- 
    Document   : atDB
    Created on : 08/09/2020, 22:35:25
    Author     : lukas
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizando dados via JDBC com JSP</title>
    </head>
    <body>
        <%
            String isbn = request.getParameter("isbn").trim();

            if (isbn != null) {
                Connection conn = null;
                PreparedStatement pst = null;
                ResultSet rs = null;
                SimpleDateFormat dateFormat = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livraria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC", "root", "");
                    String sql = "select * from livros where isbn=?";
                    pst = conn.prepareStatement(sql);
                    pst.setString(1, isbn);
                    rs = pst.executeQuery();
                    pst.clearParameters();
                    dateFormat = new SimpleDateFormat("yyyy");

                    if (rs.next()) {
        %>
        <form action="atualizaDB.jsp" method="post">
            <table>
                <tr>
                    <td>ISBN:</td>
                    <td><input type="text" name="isbn" value="<%= rs.getString("isbn")%>" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>Título:</td>
                    <td><input type="text" name="titulo" value="<%= rs.getString("titulo")%>"</td>
                </tr>
                <tr>
                    <td>Edição:</td>
                    <td><input type="text" name="edicao" value="<%= rs.getString("edicao_num")%>"</td>
                </tr>
                <tr>
                    <td>Publicação:</td>
                    <td><input type="text" name="publicacao" value="<%= rs.getString("ano_publicacao")%>"</td>
                </tr>
                <tr>
                    <td>Descrição:</td>
                    <td><textarea name="descricao" rows="5" cols="25"> <%= rs.getString("descricao")%></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="Submit" name="btAtualizar" value="Atualizar" />
                    </td>
                    
                </tr>
            </table>
        </form>

        <% } else {
                        out.println("Livro não encontrado na base de dados!");
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {
                    if (conn != null) {
                        conn.close();
                    }
                    if (pst != null) {
                        pst.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                }
            }
        %>
    </body>
</html>
