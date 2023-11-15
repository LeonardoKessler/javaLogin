<%@page import="java.sql.*"%>
<%@page import="config.SistemaUsuariosDb"%>

<%
    RequestDispatcher rd = request.getRequestDispatcher("listar-usuarios.jsp");

    String nome = request.getParameter("nome");
    String nivel = request.getParameter("nivel");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    try {
        Connection connection = SistemaUsuariosDb.getConnection();
        Statement statement = connection.createStatement();
        
        statement.execute("UPDATE usuario SET nome = '" + nome + "', nivel = '" + nivel + "', email = '" + email + "', senha = '" + senha + "'");
    } catch (Exception ex) {

    }
%>