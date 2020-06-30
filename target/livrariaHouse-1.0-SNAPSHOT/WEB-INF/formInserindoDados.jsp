<%-- 
    Document   : formInserindoDados
    Created on : 29/06/2020, 22:57:19
    Author     : lukas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserindo dados via JDBC com JSP</title>
    </head>
    <body style="color: white; background-color: #7f53ee"  >
        <form action="inserindoDados.jsp" method="post">
            <table>
                <tr>
                    <td>ISBN:</td>
                    <td><input type="text" name="isbn" /></td>
                </tr>
                <tr>
                    <td>Título:</td>
                    <td><input type="text" name="titulo" /></td>
                </tr>
                <tr>
                    <td>Edição:</td>
                    <td><input type="text" name="edicao" /></td>
                </tr>
                <tr>
                    <td>Publicação:</td>
                    <td><input type="text" name="publicacao" /></td>
                </tr>
                <tr>
                    <td>Descrção:</td>
                    <td><textarea name="descricao" rows="5" cols="25"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td><input type="submit" name="btCadastrar" value="Enviar" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
