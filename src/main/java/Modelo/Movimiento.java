package Modelo;

import java.util.Date;

public class Movimiento {
	private int id;
	private Date fecha;
	public String tipo;
	public String nombre;
	public float debe;
	public float haber;
	
	public Movimiento(){	
		super();
	};
	
	public Movimiento(int id, Date fecha, String tipo, String nombre, float debe, float haber) {
		super();
		this.id = id;
		this.fecha= fecha;
		this.tipo= tipo;
		this.nombre = nombre;
		this.debe = debe;
		this.haber = haber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public float getDebe() {
		return debe;
	}

	public void setDebe(float debe) {
		this.debe = debe;
	}

	public float getHaber() {
		return haber;
	}

	public void setHaber(float haber) {
		this.haber = haber;
	}
	
	
}


