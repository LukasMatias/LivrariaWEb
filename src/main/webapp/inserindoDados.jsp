<%-- 
    Document   : inserindoDados
    Created on : 29/06/2020, 23:11:24
    Author     : lukas
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%
            String isbn = request.getParameter("isbn");
            String titulo = request.getParameter("titulo");
            String edicao = request.getParameter("edicao");
            String publicacao = request.getParameter("publicacao");
            String descricao = request.getParameter("descricao");

            Connection conn = null;
            PreparedStatement pst = null;

            try {
                  Class.forName("com.mysql.jdbc.Driver").newInstance();
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livraria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC", "root", "");
                        String sql = "INSERT INTO livros (isbn, titulo, edicao_num, ano_publicacao, descricao)"
                                + "VALUES(?,?,?,?,?)";
                        pst = conn.prepareStatement(sql);
                        pst.setString(1, isbn);
                        pst.setString(2, titulo);
                        pst.setString(3, edicao);
                        pst.setString(4, publicacao);
                        pst.setString(5, descricao);
                        pst.executeUpdate();
                       // pst.clearParameters(); Limpa os parametros e não salva no banco.
            }catch(Exception ex){
                ex.printStackTrace();
            }finally{
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            }
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>Dados recebidos</title>
    </head>
    
    <body>
        O ISBN <strong><%=isbn%></strong> foi inserido com sucesso!
    </body>
</html>
