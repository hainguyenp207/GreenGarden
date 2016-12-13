package hainguyen.dao.implResponsitory;

import hainguyen.dao.responsitory.CrudBehavior;
import org.hibernate.Criteria;
import org.hibernate.PersistentObjectException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.GenericTypeResolver;
import org.springframework.dao.DataAccessException;

import java.util.List;


public class CrudImpl<T> implements CrudBehavior<T> {
	
	@Autowired
	private SessionFactory sessionFactory;
	private Class<T> EntityType;

	@SuppressWarnings("unchecked")
	public CrudImpl() {
		// get type class
		EntityType = (Class<T>) GenericTypeResolver.resolveTypeArgument(getClass(), CrudImpl.class);
	}



	public List<T> getAll() {
		// TODO Auto-generated method stub
		// Getall class entity by using Critiria Query
		List<T> objects = getCurrentSession().createCriteria(EntityType).list();
		return  objects;
	}

	public List<T> findByParameter(String paramter, String value){
		Criteria criteria = sessionFactory.getCurrentSession().
				createCriteria(EntityType);
		List<Object> object = criteria.add(Restrictions.eq(paramter, value))
				.list();
		return (List<T>) object;
	}
	
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

	
	public T update(T entity) {
		// TODO Auto-generated method stub
		//Update entity to entity class using Critiria Query

		try{
			getCurrentSession().update(entity);
			return entity;
		}catch(DataAccessException ex){
			return null;
		}

	}

	
	public T findbyID(String ID) {
		// TODO Auto-generated method stub
		//Find one  entity in entity class using Critiria Query

		Object object = getCurrentSession().get(EntityType, ID);
		if (object != null) {
			return EntityType.cast(object);
		}
		return null;
	}

	
	public T delete(String ID,String error) {
		// TODO Auto-generated method stub
		//Delete entity to entity class using Critiria Query

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

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
}
