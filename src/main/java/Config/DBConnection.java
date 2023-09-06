package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	private Connection conexion;
	static String user="root";
	static String password="";
	static String server="jdbc:mysql://localhost:3306/libro_diario";

	
	public Connection conectar() throws SQLException {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conexion = DriverManager.getConnection(server, user, password);
	        System.out.println("conecto");
	        return conexion;
	        
	    } catch (ClassNotFoundException | SQLException e) {
	        System.out.println("Imposible realizar conexión con la BD");
	        throw new SQLException("Error en la conexión a la BD", e); // Lanzar una nueva excepción SQLException
	    }
	}


	public DBConnection() {
		super();
		// TODO Auto-generated constructor stub
	}


	public void cerrarConexion(ResultSet rs){
		if(rs !=null){
			try{
				rs.close();
			}
			catch(Exception e){
				System.out.print("No es posible cerrar la Conexion");
			}
		}
	}


	public void destruir(){
		if(conexion !=null){
	
		try{
			conexion.close();
		}
		catch(Exception e){}
		}
	}

}
