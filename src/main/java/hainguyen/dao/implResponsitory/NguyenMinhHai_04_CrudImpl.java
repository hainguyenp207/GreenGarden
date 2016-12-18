package hainguyen.dao.implResponsitory;

import hainguyen.dao.responsitory.NguyenMinhHai_04_CrudBehavior;
import org.hibernate.Criteria;
import org.hibernate.PersistentObjectException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.GenericTypeResolver;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Thực thi interface NguyenMinhHai_04_CrudBehavior<T>
 * Tương tác với database thông qua Hibernate
 * Created by jinz on 12/12/16.
 * Tất cả các hàm, đều được viết bởi Hải cùng một ngày
 * @param <T>
 */
public class NguyenMinhHai_04_CrudImpl<T> implements NguyenMinhHai_04_CrudBehavior<T> {
	
	@Autowired
	private SessionFactory sessionFactory;
	private Class<T> EntityType;

	/**
	 * Ép kiểu generic về dạng cụ thể
	 */
	@SuppressWarnings("unchecked")
	public NguyenMinhHai_04_CrudImpl() {
		// get type class
		EntityType = (Class<T>) GenericTypeResolver.resolveTypeArgument(getClass(), NguyenMinhHai_04_CrudImpl.class);
	}


	/**
	 * Lấy tất cả các record trong bảng tương ứng
	 * @return
	 */
	public List<T> getAll() {
		// TODO Auto-generated method stub
		// Getall class entity by using Critiria Query
		List<T> objects = getCurrentSession().createCriteria(EntityType).list();
		return  objects;
	}

	/**
	 * Tìm các record theo tham số và giá trị cho trước
	 * @param paramter
	 * @param value
	 * @return
	 */
	public List<T> findByParameter(String paramter, String value){
		Criteria criteria = sessionFactory.getCurrentSession().
				createCriteria(EntityType);
		List<Object> object = criteria.add(Restrictions.eq(paramter, value))
				.list();
		return (List<T>) object;
	}

	/**
	 * Thêm 1 record vào database
	 * @param entity
	 * @return
	 */
	public T insert(T entity) {
		// TODO Auto-generated method stub
		//Insert entity to entity class using Critiria Query

		try {
			getCurrentSession().persist(entity);
			return entity;
		} catch (DataAccessException ex) {
			
		}
		return null;
	}

	/**
	 * Cập nhập 1 record vào database
	 * @param entity
	 * @return
	 */
	public T update(T entity) {
		// TODO Auto-generated method stub
		//Update entity to entity class using Critiria Query

		try{
			getCurrentSession().clear();
			getCurrentSession().update(entity);
			getCurrentSession().flush();
			return entity;
		}catch(DataAccessException ex){
			return null;
		}

	}

	/**
	 * Tìm kiếm 1 record trong database
	 * @param ID
	 * @return
	 */
	public T findbyID(String ID) {
		// TODO Auto-generated method stub
		//Find one  entity in entity class using Critiria Query

		Object object = getCurrentSession().get(EntityType, ID);
		if (object != null) {
			return EntityType.cast(object);
		}
		return null;
	}

	/**
	 * Xóa 1 record theo id
	 * @param ID
	 * @param error
	 * @return
	 */
	public T delete(String ID,String error) {
		// TODO Auto-generated method stub
		//Delete entity to entity class using Critiria Query
		// Tìm record đã tồn tại
		T find = findbyID(ID);
		if (find != null) {
			try{
				getCurrentSession().delete(find);
			}catch (PersistentObjectException hibernateError){
				error = hibernateError.getMessage();
			}

		}
		return find; //find can null
	}

	/**
	 * Lấy session của Hibernate
	 * @return
	 */
	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
}
