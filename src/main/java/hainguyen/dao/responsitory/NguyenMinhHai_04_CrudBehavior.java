package hainguyen.dao.responsitory;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Interface xử lý nghiệp vụ Thêm, Sửa, Xóa dạng generic
 * @param <T>
 */
public interface NguyenMinhHai_04_CrudBehavior<T> {
	
	List<T> getAll(); // GET
	
	T insert(T entity); // POST

	T update(T entity); // PUT

	T findbyID(String ID); // GET

	T delete(String ID, String error); // DELETE

	List<T> findByParameter(String paramter, String value);
}
