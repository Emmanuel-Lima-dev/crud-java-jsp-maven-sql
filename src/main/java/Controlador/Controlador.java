package Controlador;

import java.io.IOException;

import Modelo.CuentaContable;
import Modelo.Movimiento;
import ModeloDAO.CuentaContableDAO;
import ModeloDAO.MovimientoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controlador
 */

public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlador() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    String inicio="index.jsp";
    String listar="Vista/libroDiario.jsp";
    String listaCuentas="Vista/cuentasContables.jsp";
    Movimiento mov= new Movimiento();
    MovimientoDAO movDAO = new MovimientoDAO(); 
    CuentaContable ctaCont = new CuentaContable();
    CuentaContableDAO ctaContDAO= new CuentaContableDAO();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String acceso="";
		String action=request.getParameter("accion");
		
		if(action.equalsIgnoreCase("inicio")) {
			acceso=inicio;
			
		}else if(action.equalsIgnoreCase("listar")) {
			acceso=listar;
			
		}else if(action.equalsIgnoreCase("edit")){
			request.setAttribute("idMov", request.getParameter("idmov"));
			acceso="Vista/edit.jsp";
			
		}else if(action.equalsIgnoreCase("actualizar")) {
			String id=request.getParameter("editTxtid");int numId = Integer.parseInt(id);
			String tipo = request.getParameter("editTxtTipo");
			String cuenta = request.getParameter("editTxtCuenta");
			String debe = request.getParameter("editTxtDebe");float debeFloat = Float.parseFloat(debe);
			String haber = request.getParameter("editTxtHaber");float haberFloat = Float.parseFloat(haber);
			mov.setId(numId);
			mov.setTipo(tipo);
			mov.setNombre(cuenta);
			mov.setDebe(debeFloat);
			mov.setHaber(haberFloat);
			movDAO.edit(mov);
			response.sendRedirect("Controlador?accion=listar");
			return;
		}
		else if(action.equalsIgnoreCase("listaCuentas")) {
			acceso=listaCuentas;
			
		}else if(action.equalsIgnoreCase("eliminar")){
			String id= request.getParameter("id");
			int idMovimiento = Integer.parseInt(id);
			movDAO.delete(idMovimiento);
			acceso=listar;
			
		}
		else if(action.equalsIgnoreCase("eliminarCC")){
			String id= request.getParameter("id");
			int idCC = Integer.parseInt(id);
			ctaContDAO.delete(idCC);
			acceso=listaCuentas;
		}
		else if(action.equalsIgnoreCase("agregar")) {
			String tipo = request.getParameter("txtTipo");
			String cuenta = request.getParameter("txtCuenta");
			String debe = request.getParameter("txtDebe");float debeFloat = Float.parseFloat(debe);
			String haber = request.getParameter("txtHaber");float haberFloat = Float.parseFloat(haber);
			mov.setTipo(tipo);
			mov.setNombre(cuenta);
			mov.setDebe(debeFloat);
			mov.setHaber(haberFloat);
			movDAO.add(mov);
			response.sendRedirect("Controlador?accion=listar");
			return;
		}else if(action.equalsIgnoreCase("agregarCuenta")) {
			String nombre = request.getParameter("txtCuenta");
			String clasificacion = request.getParameter("txtTipo");
			String descripcion = request.getParameter("txtDescripcion");
			ctaCont.setNombre(nombre);
			ctaCont.setClasificacion(clasificacion);
			ctaCont.setDescripcion(descripcion);
			ctaContDAO.add(ctaCont);
			response.sendRedirect("Controlador?accion=listaCuentas");
			return;
		}
		
		RequestDispatcher vista=request.getRequestDispatcher(acceso);
		vista.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
