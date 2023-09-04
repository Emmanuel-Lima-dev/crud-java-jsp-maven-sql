package Crud;

import java.util.List;

public interface CRUD<t> {
	
	
	public List<t> listar();
	public t list(int id);
	public boolean add(t mov);
	public boolean edit(t mov);
	public boolean delete(int id);
	
}
