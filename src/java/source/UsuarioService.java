/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package source;

import java.util.ArrayList;
import java.util.List;
import model.Usuario;
import java.sql.*;
import config.SistemaUsuariosDb;

/**
 *
 * @author Aluno
 */
public class UsuarioService {

    public List<Usuario> listarUsuarios(String filtro) {
        List<Usuario> usuarios = new ArrayList();

        try {
            Connection connection = SistemaUsuariosDb.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = null;

            if (filtro == null || filtro == "") {
                resultSet = statement.executeQuery("SELECT * FROM usuario");
            } else {
                resultSet = statement.executeQuery("SELECT * FROM usuario WHERE email LIKE '%" + filtro + "%' OR nome LIKE '%" + filtro + "%'");
            }

            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                Integer id = Integer.parseInt(resultSet.getString("id"));
                usuario.setId(id);
                usuario.setNome(resultSet.getString("nome"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setNivel(resultSet.getString("nivel"));

                usuarios.add(usuario);
            }

        } catch (Exception ex) {
            System.out.println("Erro ao buscar os usuários");
            ex.printStackTrace();
        }
        return usuarios;
    }

    public Usuario detalharUsuario(Integer idUsuario) {
        Usuario usuario = null;

        try {
            Connection connection = SistemaUsuariosDb.getConnection();
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT * FROM usuario WHERE id = '" + idUsuario + "'");

            while (resultSet.next()) {
                usuario = new Usuario();
                Integer id = Integer.parseInt(resultSet.getString("id"));
                usuario.setId(id);
                usuario.setNome(resultSet.getString("nome"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setNivel(resultSet.getString("nivel"));
                usuario.setSenha(resultSet.getString("senha"));
            }

        } catch (Exception ex) {
            System.out.println("Erro ao detalhar usuario");
            ex.printStackTrace();
        }

        return usuario;
    }
}
