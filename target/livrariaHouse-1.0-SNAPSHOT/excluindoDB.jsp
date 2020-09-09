<%-- 
    Document   : excluindoDB
    Created on : 30/06/2020, 18:40:38
    Author     : lukas
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Livro</title>
    </head>
    <body>
        <%
            String isbn = request.getParameter("isbn");
            if(isbn != null){
                Connection conn = null;
                Statement st = null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livraria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC", "root", "");
                        st = conn.createStatement();
                        
                        st.executeUpdate("DELETE FROM livros WHERE isbn='"+isbn+"'");
                        out.println("O livro de ISBN <strong>" + isbn + "</strong> foi excluído com sucesso!");
                        
                } catch (Exception ex){
                    ex.printStackTrace();
                    out.print("ERRO ao excluir");
                } finally {
                    if (st != null) st.close();
                    if(conn != null) conn.close();
                }
            }
        %>
    </body>
</html>
