<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ModeloDAO.CuentaContableDAO" %>
<%@ page import="Modelo.CuentaContable" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="navBar.jsp" />
	<div class="container-lg">
		<h1 class="text-center h-3 pt-5 mt-5 mb-4 text-muted">Lista de cuentas</h1>
		<button type="button" class="btn btn-success rounded-0 text-capitalize mb-3" data-bs-toggle="modal" data-bs-target="#movimientoNuevo" data-bs-whatever="@mdo"><i class="bi bi-plus"></i>Cuenta nueva</button>
		<h3 class="h-6 mb-3 text-muted">Cuentas del Activo</h3>
		<table class="table table-success table-striped">
			<thead class="table-dark">
	                <tr>
	                  
	                  <th class="col-3 border">Clasificación</th>
	                  <th class="col-3 border">Nombre</th>
	                  <th class="col-6 border">Descripción</th>
	                  
	                </tr>
	          </thead>
			 
			  <tbody>
			  		<%CuentaContableDAO ccDAO = new CuentaContableDAO(); 
					   List<CuentaContable> res= ccDAO.listar();
					   for(CuentaContable Act : res  ){
						   if(Act.getClasificacion().equalsIgnoreCase("activo")){   
					 %>
	                <tr>
	                
	                
	                	<td class="col-3 text-capitalize"><%= Act.getClasificacion() %></td>
	                    <td class="col-3 text-capitalize"><%= Act.getNombre() %></td>
	                    <td class="col-6 text-capitalize"><%= Act.getDescripcion() %></td>  
	                    <td style="cursor: pointer;"><a href="Controlador?accion=eliminarCC&id=<%= Act.getId() %>"><i class="bi bi-trash3-fill"></i></a></td>
	                    
	                </tr>
	            	<%	
	            		}
					   }
			 		%>
	          </tbody>
		</table>
		
		<h3 class="h-6 mb-3 text-muted">Cuentas del Pasivo</h3>
		<table class="table table-success table-striped">
			<thead class="table-dark">
	                <tr>
	                  
	                  <th class="col-3 border">Clasificación</th>
	                  <th class="col-3 border">Nombre</th>
	                  <th class="col-6 border">Descripción</th>
	                  
	                </tr>
	          </thead>
			 
			  <tbody>
			  		<%
					   for(CuentaContable Pas : res  ){
						   if(Pas.getClasificacion().equalsIgnoreCase("pasivo")){   
					 %>
	                <tr>
	                
	                	<td class="col-3 text-capitalize"><%= Pas.getClasificacion() %></td>
	                    <td class="col-3 text-capitalize"><%= Pas.getNombre() %></td>
	                    <td class="col-6 text-capitalize"><%= Pas.getDescripcion() %></td>  
	                    <td style="cursor: pointer;"><a href="Controlador?accion=eliminarCC&id=<%= Pas.getId() %>"><i class="bi bi-trash3-fill"></i></a></td>
	                    
	                    
	                </tr>
	             <%
						   }
					   }
	             %>
	          </tbody>
		</table>
		
		<h3 class="h-6 mb-3 text-muted">Cuentas de Resultado Positivo</h3>
		<table class="table table-success table-striped">
			<thead class="table-dark">
	                <tr>
	                  
	                  <th class="col-3 border">Clasificación</th>
	                  <th class="col-3 border">Nombre</th>
	                  <th class="col-6 border">Descripción</th>
	                  
	                </tr>
	          </thead>
			 
			  <tbody>
			  		<%
					   for(CuentaContable RP : res  ){
						   if(RP.getClasificacion().equalsIgnoreCase("resultado positivo")){   
					 %>
	                <tr>
	                
	                	<td class="col-3 text-capitalize"><%= RP.getClasificacion() %></td>
	                    <td class="col-3 text-capitalize"><%= RP.getNombre() %></td>
	                    <td class="col-6 text-capitalize"><%= RP.getDescripcion() %></td>  	                    
	                    <td style="cursor: pointer;"><a href="Controlador?accion=eliminarCC&id=<%= RP.getId() %>"><i class="bi bi-trash3-fill"></i></a></td>
	                    
	                    
	                </tr>
	             <%
						   }
					   }
	             %>
	          </tbody>
		</table>
		
		<h3 class="h-6 mb-3 text-muted">Cuentas de Resultado Negativo</h3>
		<table class="table table-success table-striped">
			<thead class="table-dark">
	                <tr>
	                  
	                  <th class="col-3 border">Clasificación</th>
	                  <th class="col-3 border">Nombre</th>
	                  <th class="col-6 border">Descripción</th>
	                  
	                </tr>
	          </thead>
			 
			  <tbody>
			  		<%
					   for(CuentaContable RN : res  ){
						   if(RN.getClasificacion().equalsIgnoreCase("resultado negativo")){   
					 %>
	                <tr>
	                
	                	<td class="col-3 text-capitalize"><%= RN.getClasificacion() %></td>
	                    <td class="col-3 text-capitalize"><%= RN.getNombre() %></td>
	                    <td class="col-6 text-capitalize"><%= RN.getDescripcion() %></td>  	                    
	                    <td style="cursor: pointer;"><a href="Controlador?accion=eliminarCC&id=<%= RN.getId() %>"><i class="bi bi-trash3-fill"></i></a></td>
	                    
	                    
	                </tr>
	             <%
						   }
					   }
	             %>
	          </tbody>
		</table>
		
		<h3 class="h-6 mb-3 text-muted">Cuentas de Patrimonio Neto</h3>
		<table class="table table-success table-striped">
			<thead class="table-dark">
	                <tr>
	                  
	                  <th class="col-3 border">Clasificación</th>
	                  <th class="col-3 border">Nombre</th>
	                  <th class="col-6 border">Descripción</th>
	                  
	                </tr>
	          </thead>
			 
			  <tbody>
			  		<%
					   for(CuentaContable PN : res  ){
						   if(PN.getClasificacion().equalsIgnoreCase("patrimonio neto")){   
					 %>
	                <tr>
	                
	                	<td class="col-3 text-capitalize"><%= PN.getClasificacion() %></td>
	                    <td class="col-3 text-capitalize"><%= PN.getNombre() %></td>
	                    <td class="col-6 text-capitalize"><%= PN.getDescripcion() %></td>  	                    
	                    <td style="cursor: pointer;"><a href="Controlador?accion=eliminarCC&id=<%= PN.getId() %>"><i class="bi bi-trash3-fill"></i></a></td>
	                    
	                    
	                </tr>
	             <%
						   }
					   }
	             %>
	          </tbody>
		</table>
		
		<%-- modal cuenta contable nueva --%>
		
		<div>
         
        	<div class="modal fade" id="movimientoNuevo" tabindex="-1" aria-labelledby="movimientoNuevoLabel" aria-hidden="true">
			  	
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="movimientoNuevoLabel">Registrar nueva cuenta contable</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form>
			        
			          	<label for="tipo" class="form-label">Tipo</label>
                		<select name="txtTipo" id="tipo" class="form-select rounded-0 cursor-pointer mb-3">
		                	<option value="activo">Activo</option>
		                	<option value="pasivo">Pasivo</option>
		                	<option value="resultado positivo">Resultado positivo</option>
		                	<option value="resultado negativo">Resultado negativo</option>
		                	<option value="patrimonio neto">Patrimonio neto</option>
                		</select>
                		
                		<label for="cuenta" class="form-label">Nombre Cuenta</label><br>
						<input type="text" class="form-control rounded-0 cursor-pointer mb-3" id="cuenta" name="txtCuenta" required>
                		
						<label for="descripcion" class="form-label">Descripción</label><br>
						<input type="text" class="form-control rounded-0 cursor-pointer mb-3" id="descripcion" name="txtDescripcion">
	
						<input type="submit" name="accion" value="agregarCuenta" class="btn btn-danger text-capitalize rounded-0">
						<button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal">Cancelar</button>
						
			        </form>
			      </div>
			    </div> 
			  </div>
		   </div>
      	</div>
		
	</div>
	
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	
</body>
</html>