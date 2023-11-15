<%-- 
    Document   : index
    Created on : 24/10/2023, 19:41:22
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.SistemaUsuariosDb"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="assets/comum.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>Login</title>
    </head>
    <body>
        <div class="container px-5 my-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-0 rounded-3 shadow-lg">
                        <div class="card-body p-4">
                            <div class="text-center">
                                <div class="h1 fw-light">Sistema Usuários</div>
                            </div>
                            <form method="post">
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="email" name="email" type="text" placeholder="email" />
                                    <label for="email">Email</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input class="form-control" id="senha" name="senha" type="text" placeholder="senha" />
                                    <label for="senha">Senha</label>
                                </div>

                                <div class="d-grid">
                                    <button class="btn btn-primary btn-lg" id="submitButton" type="submit">Entrar</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div> 

        <%
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            if (email != null && senha != null) {
                Connection connection = SistemaUsuariosDb.getConnection();
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM usuario WHERE email = '" + email + "' AND senha = '" + senha + "'");

                String nomeUsuario = "";
                boolean possuiConta = false;
                while (resultSet.next()) {
                    nomeUsuario = resultSet.getString("nome");
                    possuiConta = true;
                }

                if (possuiConta) {
                    session.setAttribute("nomeUsuario", nomeUsuario);
                    response.sendRedirect("listar-usuarios.jsp");
                } else {
                    out.println("credenciais incorretas");
                }
            }
        %>

    </body>
</html>
