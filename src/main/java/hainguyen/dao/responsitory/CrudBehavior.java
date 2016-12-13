package hainguyen.dao.responsitory;

import java.util.List;

public interface CrudBehavior<T> {
	
	List<T> getAll(); // GET
	
	T insert(T entity); // POST

	T update(T entity); // PUT

	T findbyID(String ID); // GET

	T delete(String ID, String error); // DELETE

	List<T> findByParameter(String paramter, String value);
}
