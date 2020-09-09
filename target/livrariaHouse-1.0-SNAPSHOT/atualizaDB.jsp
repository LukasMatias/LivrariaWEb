<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

'<%-- 
    Document   : atualizaDB
    Created on : 08/09/2020, 23:08:33
    Author     : lukas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados atualizado</title>
    </head>
    <body>
        <%
            String isbn = request.getParameter("isbn");
            String titulo = request.getParameter("titulo");
            String edicao = request.getParameter("edicao");
            String publicacao = request.getParameter("publicacao");
            String descricao = request.getParameter("publicacao");

            if (isbn != null) {
                Connection conn = null;
                PreparedStatement pst = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livraria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC", "root", "");

                    String sql = "UPDATE livros set titulo=?, edicao_num=?, ano_publicacao=?, descricao=? WHERE isbn=?";
                    pst = conn.prepareStatement(sql);
                    pst.setString(1, titulo);
                    pst.setInt(2, Integer.parseInt(edicao));
                    pst.setString(3, publicacao);
                    pst.setString(4, descricao);
                    pst.setString(5, isbn);
                    pst.executeUpdate();
                    pst.clearParameters();
                    out.println("os dados do ISBN: " + isbn + " Foram atualizados com sucesso!");
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.println("ERRO ao atualizar");
                } finally {
                    if (conn != null) {
                        conn.close();
                    }
                    if (pst != null) {
                        pst.close();
                    }
                }
            } else {
                out.println("ISBN não existente");
            }
        %>
    </body>
</html>
