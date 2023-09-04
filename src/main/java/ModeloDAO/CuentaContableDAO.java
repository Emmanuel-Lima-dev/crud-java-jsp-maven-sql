package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Config.DBConnection;
import Crud.CRUD;
import Modelo.CuentaContable;

public class CuentaContableDAO implements CRUD<CuentaContable>{

	DBConnection con = new DBConnection();
	Connection c;
	Statement st;
	ResultSet rs;
	
	@Override
	public List<CuentaContable> listar() {
		
		List<CuentaContable> list = new ArrayList<>();
		String sql = "select * from cuenta_contable";
		
		try {
			c=con.conectar();
			st=c.createStatement();
			rs= st.executeQuery(sql);
			while(rs.next()){
				CuentaContable cc = new CuentaContable();
				cc.setId(rs.getInt("id"));
				cc.setNombre(rs.getString("nombre"));
				cc.setClasificacion(rs.getString("clasificacion"));
				cc.setDescripcion(rs.getString("descripcion"));
				list.add(cc);
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			try {
				if( rs != null) {
					rs.close();
				}if (st != null) {
					st.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public CuentaContable list(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean add(CuentaContable cc) {
		String sql="insert into cuenta_contable(nombre, clasificacion, descripcion) values (?, ?, ?)";
		try {
			 c = con.conectar();
		        PreparedStatement pstmt = c.prepareStatement(sql);
		        pstmt.setString(1, cc.getNombre());
		        pstmt.setString(2, cc.getClasificacion());
		        pstmt.setString(3, cc.getDescripcion());

		        int rowsAffected = pstmt.executeUpdate();
		        pstmt.close();
		        c.close();

		        return rowsAffected > 0;
		}catch (Exception e){
			
		}
		return false;
	}

	@Override
	public boolean edit(CuentaContable mov) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {
		String sql="delete from cuenta_contable where id=?";
		try {
			c=con.conectar();
			PreparedStatement pstm = c.prepareStatement(sql);
			pstm.setInt(1, id);
			
			int filasEliminadas= pstm.executeUpdate();
			return filasEliminadas > 0;
		}catch(Exception e) {
			e.printStackTrace(); 
		}
		return false;
	}

	

}
