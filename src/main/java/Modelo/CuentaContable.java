package Modelo;

public class CuentaContable {
	private int id;
	public String nombre;
	public String clasificacion;
	public String descripcion;
	
	public CuentaContable() {
		
	}

	public CuentaContable(int id,String nombre, String clasificacion, String descripcion) {
		super();
		this.id = id;
		this.nombre= nombre;
		this.clasificacion = clasificacion;
		this.descripcion = descripcion;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getClasificacion() {
		return clasificacion;
	}

	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
	
}
