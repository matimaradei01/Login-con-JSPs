package paqueteJava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import paqueteJava.Persona;


public class ConexionJDBC {
    
    public String driver = "com.mysql.jdbc.Driver";
    public String database = "logueo";
    public String hostname = "localhost";
    public String port = "3306";
    public String ruta_url = "jdbc:mysql://" + hostname + ": port" + "/" + database + "?useSSL=false";
    public String username = "admin";
    public String pass = "admin";
           
    
    public Persona logear(String username, String password) throws SQLException{
        
        Persona p = null;
        Connection conn = DriverManager.getConnection(ruta_url, this.username, pass);
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String select = "SELECT * FROM LOGIN WHEN nombre =" +username+ "AND apellido=" +password;
        
        try {
            ps = conn.prepareStatement(select);
            rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String user = rs.getString("nombre");
                String pass = rs.getString("contraseña");
                String estado = rs.getString("estado");
                
               p = new Persona(id, user, pass, estado);

            }   
        } catch (SQLException ex) {
            
            ex.printStackTrace();
            
        }finally{
            
        rs.close();
        ps.close();
        conn.close();
        
        }
        return p; 
    }
}