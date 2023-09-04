package Modelo;

public class Usuario {
	
	private Integer id;
	private String primer_nombre;
	private String email;
	private String nombre_usuario;
	private String contraseña;
	

	public Usuario(int id, String primer_nombre, String email, String nombre_usuario, String contraseña) {
		super();
		this.id = id;
		this.primer_nombre = primer_nombre;
		this.email = email;
		this.nombre_usuario = nombre_usuario;
		this.contraseña = contraseña;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getPrimer_nombre() {
		return primer_nombre;
	}
	
	public void setPrimer_nombre(String primer_nombre) {
		this.primer_nombre = primer_nombre;
	}
	
	public String getNombre_usuario() {
		return nombre_usuario;
	}
	
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getContraseña() {
		return contraseña;
	}
	

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	
}
