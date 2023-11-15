package config;


import java.sql.*;
import com.mysql.jdbc.Driver;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Aluno
 */
public class SistemaUsuariosDb {
//             Db = dataBase

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection = null;
        try {
            String nomeDriver = "com.mysql.jdbc.Driver";
            Class.forName(nomeDriver);

            String localServidor = "localhost";
            String nomeDoBanco = "sistema_usuarios";
            String url = "jdbc:mysql://" + localServidor + "/" + nomeDoBanco;
            String user = "root";
            String password = "";

            connection = DriverManager.getConnection(url, user, password);
        } catch (Exception ex) {
            System.out.println("ocorreu um erro na conexao com o banco de dados");
            ex.printStackTrace();
        }
        return connection;
    }
}
