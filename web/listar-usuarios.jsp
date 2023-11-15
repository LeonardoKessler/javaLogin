<%-- 
    Document   : listar-usuarios
    Created on : 26/10/2023, 21:49:11
    Author     : Aluno
--%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@page import="source.UsuarioService"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="listar-usuarios.jsp">Lista de usuarios</a>

                <!--                 -->
                <div>
                    <span>
                        <%
                            String nomeUsuario = session.getAttribute("nomeUsuario").toString();
                            if (nomeUsuario == null) {
                                response.sendRedirect("index.jsp");
                            } else {
                                out.println("bem vindo " + nomeUsuario);
                            }
                        %>
                    </span>
                    <a href="logout.jsp">Sair</a>
                </div>
            </div>
        </nav>
        <div class="container">
            <div style="width: 100%" class="d-flex justify-content-between mt-2">
                <a href="inserir-usuario.jsp" class="btn btn-outline-primary">Novo usuário</a>
                <form action="listar-usuarios-controller.jsp" method="post" class="d-flex">
                    <input name="filtro-usuario" class="form-control me-2" placeholder="Nome ou Email">
                    <button class="btn btn-primary" type="submit">Buscar</button>
                </form>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Email</th>
                        <th scope="col">Nível</th>
                        <th scope="col">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Usuario> usuarios = null;
                        boolean primeiraBusca;
                        primeiraBusca = request.getAttribute("usuarios") == null;

                        UsuarioService usuarioService = new UsuarioService();
                        
                        if (primeiraBusca) {
                        usuarios = usuarioService.listarUsuarios("");
                        } else {
                        usuarios = (List<Usuario>) request.getAttribute("usuarios");
                        }

                        for (Usuario usuario : usuarios) {
                    %>
                    <tr>
                        <th><% out.println(usuario.getId()); %></th>
                        <td><% out.println(usuario.getNome()); %></td>
                        <td><% out.println(usuario.getEmail()); %></td>
                        <td><% out.println(usuario.getNivel()); %></td>
                        <td>
                            <a href="editar-usuario.jsp?id=<%out.println(usuario.getId()); %>">Editar</a>
                        </td>
                    </tr>
                    <% }
                    %>
                </tbody>
            </table>
        </div>


    </body>
</html>
