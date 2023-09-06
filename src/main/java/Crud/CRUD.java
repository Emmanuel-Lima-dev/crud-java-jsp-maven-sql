package Crud;

import java.util.List;

public interface CRUD<t> {
	
	
	public List<t> listar();
	public t list(int id);
	public boolean add(t elemento);
	public boolean edit(t elemento);
	public boolean delete(int id);
	
}
