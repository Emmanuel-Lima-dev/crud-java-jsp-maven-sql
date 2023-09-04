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
import Modelo.Movimiento;

public class MovimientoDAO implements CRUD<Movimiento>{
	
	DBConnection cn = new DBConnection();
	Connection con;
	ResultSet rs;
	Statement instruccion;
	Movimiento mov=new Movimiento();
	

	@Override
	public List<Movimiento> listar(){
		
	    List<Movimiento> list = new ArrayList<>();
	    String sql = "select * from movimiento";
	    try {
	    	con=cn.conectar();
	    	instruccion = con.createStatement();
	        rs = instruccion.executeQuery(sql);
	        System.out.println("Método listar() se está llamando.");
	        while (rs.next()) {
	        	Movimiento m= new Movimiento();
	            m.setId(rs.getInt("id"));
	            m.setFecha(rs.getDate("fecha_registro"));
	            m.setTipo(rs.getString("tipo"));
	            m.setNombre(rs.getString("resumen"));
	            m.setDebe(rs.getFloat("debe"));
	            m.setHaber(rs.getFloat("haber"));
	            list.add(m);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (instruccion != null) {
	                instruccion.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return list;
	}

	@Override
	public Movimiento list(int id) {
		    String sql = "select * from movimiento where id="+id;
		    try {
		    	con=cn.conectar();
		    	instruccion = con.createStatement();
		        rs = instruccion.executeQuery(sql);
		        System.out.println("Método listar() se está llamando en list.");
		        while (rs.next()) {
		            mov.setId(rs.getInt("id"));
		            mov.setFecha(rs.getDate("fecha_registro"));
		            mov.setTipo(rs.getString("tipo"));
		            mov.setNombre(rs.getString("resumen"));
		            mov.setDebe(rs.getFloat("debe"));
		            mov.setHaber(rs.getFloat("haber"));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (rs != null) {
		                rs.close();
		            }
		            if (instruccion != null) {
		                instruccion.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    return mov;
	}

	@Override
	public boolean add(Movimiento mov) {
		String sql="insert into movimiento(tipo, resumen, debe, haber) values (?, ?, ?, ?)";
		try {
			 con = cn.conectar();
		        PreparedStatement pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, mov.getTipo());
		        pstmt.setString(2, mov.getNombre());
		        pstmt.setFloat(3, mov.getDebe());
		        pstmt.setFloat(4, mov.getHaber());

		        int rowsAffected = pstmt.executeUpdate();
		        pstmt.close();
		        con.close();

		        return rowsAffected > 0;
		}catch (Exception e){
			
		}
		return false;
	}

	@Override
	public boolean edit(Movimiento mov) {
		String sql="UPDATE movimiento SET tipo=?, resumen=?, debe=?, haber=? WHERE id=?";
		try {
			con=cn.conectar();
			PreparedStatement pstmt= con.prepareStatement(sql);
			pstmt.setString(1, mov.getTipo());
			pstmt.setString(2, mov.getNombre());
			pstmt.setFloat(3, mov.getDebe());
			pstmt.setFloat(4, mov.getHaber());
			pstmt.setInt(5, mov.getId());
			 
			int filasEditadas= pstmt.executeUpdate();
			return filasEditadas > 0;
		}catch(Exception e){
			e.printStackTrace();
			}
		return false;
	}

	@Override
	public boolean delete(int id) {
		String sql="delete from movimiento where id=?";
		try {
			 con=cn.conectar();
			 PreparedStatement pstmt= con.prepareStatement(sql);
			 pstmt.setInt(1, id);
			 
			 int filasEliminadas= pstmt.executeUpdate();
			 return filasEliminadas > 0;
		}catch (Exception e){
			e.printStackTrace();
		}finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (instruccion != null) {
	                instruccion.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return false;
	}

	

}
