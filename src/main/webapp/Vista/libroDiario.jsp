<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ModeloDAO.MovimientoDAO" %>
<%@ page import="Modelo.Movimiento" %>
<%@ page import="ModeloDAO.CuentaContableDAO" %>
<%@ page import="Modelo.CuentaContable" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <title>Título de la página</title>
  
</head>
<body>
	<jsp:include page="navBar.jsp"/>
    <div class="container-lg">
        <h1 class="text-center h-3 pt-5 mt-5 mb-4 text-muted">Libro diario de 4 columnas</h1>
        <div>
        	<button type="button" class="btn btn-success rounded-0 text-capitalize" data-bs-toggle="modal" data-bs-target="#movimientoNuevo" data-bs-whatever="@mdo"><i class="bi bi-plus"></i>movimiento nuevo</button>
            
            
            <%-- modal agregar movimiento --%>
            
        	<div class="modal fade" id="movimientoNuevo" tabindex="-1" aria-labelledby="movimientoNuevoLabel" aria-hidden="true">
			  	
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="movimientoNuevoLabel">Movimiento nuevo</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form>
			        
			          	<label for="tipo" class="form-label">Tipo</label>
                		<select name="txtTipo" id="tipo" class="form-select rounded-0 cursor-pointer mb-3" required>
		                	<option value="activo">Activo</option>
		                	<option value="pasivo">Pasivo</option>
		                	<option value="resultado positivo">Resultado positivo</option>
		                	<option value="resultado negativo">Resultado negativo</option>
		                	<option value="patrimonio neto">Patrimonio neto</option>
                		</select>
                		
                		<label for="cuenta" class="form-label">Cuenta</label>
                		<select name="txtCuenta" id="cuenta" class="form-select rounded-0 cursor-pointer mb-3" required>
                		<% CuentaContableDAO ccDAO = new CuentaContableDAO();  
			        	List<CuentaContable> listcc = ccDAO.listar();
			        	for( CuentaContable cc : listcc ){
			        		if(listcc.size()==0){
			        			
			        	%>
			        		<a class="nav-link" href="Controlador?accion=listaCuentas">Cuentas contables</a>
			        		<% } else %>
		                	<option value="<%= cc.getNombre() %>"><%= cc.getNombre() %></option>
		                	
		                <% } %>
                		</select>
                		<div class="d-flex justify-content-between">
                			<div>
	                			<label for="debe" class="form-label">Debe</label>
								<input type="text" class="form-control valorDebe rounded-0 cursor-pointer mb-3" id="debe" name="txtDebe" required  oninput="validateNumericInput(this)" value="">
                			</div>
	                		<div>
		                		<label for="haber" class="form-label">Haber</label>
								<input type="text" class="form-control valorHaber rounded-0 cursor-pointer mb-3" id="haber" name="txtHaber" required oninput="validateNumericInput(this)" value="">
	                		</div>
							
                		</div>
						
						<input type="submit" name="accion" value="agregar" class="btn btn-danger text-capitalize rounded-0">
						<button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal">Cancelar</button>
						
			        </form>
			      </div>
			    </div> 
			  </div>
		   </div>
      	</div>
      	
      
      <table id="tabla" class="table border mb-5">
          <thead class="table-dark">
                <tr>
                  <th class="col-2 border">Fecha</th>
                  <th class="col-2 border">Tipo</th>
                  <th class="col-4 border">Resumen</th>
                  <th class="col-2 border">Debe</th>
                  <th class="col-2 border">Haber</th>
                </tr>
          </thead>
		 
		
		  <tbody>
		  <%
		MovimientoDAO mov = new MovimientoDAO(); 
		   List<Movimiento> res= mov.listar();
		   for(Movimiento m : res  ){
		 %>
                <tr>
                    <td class="col-2"><%= m.getFecha() %></td>
                    <td class="col-2 text-capitalize"><%= m.getTipo() %></td>
                    <td class="col-4 text-capitalize"><%= m.getNombre() %></td>
                    <td class="col-2 debe">$<%= m.getDebe() %></td>
                    <td class="col-2 haber">$<%= m.getHaber() %></td>
                    <!-- Button trigger modal -->
					
                    <td style="cursor: pointer;"><a href="Controlador?accion=edit&idMov=<%= m.getId() %>" class="btnEditMov"><i class="bi bi-pencil-fill"></i></a></td>
                    <td style="cursor: pointer;"><a href="" class="eliminar" data-bs-toggle="modal" data-bs-target="#modalBorrar" data-get-nombre="<%= m.getNombre() %>" data-get-id="<%= m.getId() %>"><i class="bi bi-trash3-fill"></i></a></td>
                    
               
                    
                </tr>
				
     		<% }  %>
     			<tr>
          			<td class="text-uppercase text-center bg-secondary text-white" colspan="3">subtotal=</td>
          			<td class="col-2 subtotalDebe bg-light text-success"></td>
          			<td class="col-2 subtotalHaber bg-light text-danger"></td>
          		</tr>
     			<tr>
          			<td class="text-uppercase text-white text-center bg-secondary total" colspan="3">total=</td>
          			<td class="col-2 totalDebe bg-light text-capitalize"></td>
          			<td class="col-2 totalHaber bg-light text-capitalize"></td>
          		</tr>
          </tbody>
          		
         </table>
         
		      <!-- Modal borrar -->
		      
			  <div class="modal fade" id="modalBorrar" tabindex="-1" aria-labelledby="modalBorrarLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <h1 class="modal-title fs-5" id="modalBorrarLabel">Borrar movimiento</h1>
					  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body modalBody">
					  
					</div>
					<div class="modal-footer text-start">
					  					   
					  <button type="button" class="btn btn-danger rounded-0"><a href="" class="btnModalEliminar text-decoration-none text-white">Borrar</a></button>
					  <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal">Cancelar</button>
					</div>
				  </div>
				</div>
			  </div>
       
   
       
       <%-- grafico --%>
       <div class="d-flex flex-md-row align-items-center ">
       
	       <div class="col-7 col-md-4 my-3">
			  <canvas id="myChart"></canvas>
			</div>
			   
       </div>		
	 	
    </div>
	
	
	<script>
		const eliminar = document.querySelectorAll(".eliminar");
		const btnModalEliminar = document.querySelector(".btnModalEliminar");
		const modalBody= document.querySelector(".modalBody");

		eliminar.forEach((element) => {
		element.addEventListener("click", (e) => {
			e.preventDefault();
			let idData = element.getAttribute("data-get-id");
			let nombreData = element.getAttribute("data-get-nombre");
			btnModalEliminar.href = "Controlador?accion=eliminar&id=" + idData;
			modalBody.textContent='¿Está seguro que desea eliminar el movimiento "'+ nombreData+'"?';
		});
		});
		
	</script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="./javaScript/libroDiario.js"></script>
	 
	
	  
	
	<script>
	
	
		const numSubtotalDebe = parseFloat(subtotalDebe.textContent.replace("$",""));
	  	const numSubtotalHaber = parseFloat(subtotalHaber.textContent.replace("$",""));
	 
	  const ctx = document.getElementById('myChart').getContext('2d');
	  new Chart(ctx, {
	    type: 'pie',
	    data: {
	      labels: ["debe","haber"],
	      datasets: [{
	        label: 'estadísticas de transacciones',
	        data: [numSubtotalDebe, numSubtotalHaber],
	        backgroundColor: [
	            '#5cb85c',
	            '#d9534f'
	          ],
	        borderWidth: 1
	      }]
	    },
	    options: {
	      scales: {
	        y: {
	          beginAtZero: true
	        }
	      }
	    }
	  });
	
	 
	  
	
	  
	</script>
			
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.3.3/chart.min.js" integrity="sha512-fMPPLjF/Xr7Ga0679WgtqoSyfUoQgdt8IIxJymStR5zV3Fyb6B3u/8DcaZ6R6sXexk5Z64bCgo2TYyn760EdcQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
