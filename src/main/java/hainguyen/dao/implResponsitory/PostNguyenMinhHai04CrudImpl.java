package hainguyen.dao.implResponsitory;

import hainguyen.dao.entity.Post;
import hainguyen.dao.responsitory.NguyenMinhHai_04_PostNguyenMinhHai04Crud;
import hainguyen.service.NguyenMinhHai_04_PostService;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Thực thi lớp NguyenMinhHai_04_PostNguyenMinhHai04Crud
 *
 */
@Repository("PostCrud")
public class PostNguyenMinhHai04CrudImpl extends NguyenMinhHai_04_CrudImpl<Post> implements NguyenMinhHai_04_PostNguyenMinhHai04Crud {
    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    private NguyenMinhHai_04_PostService nguyenMinhHai04PostService;

    @Override
    public List<Post> getTopicPagingNew(int limit) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Post p ORDER BY p.create_date DESC");
        query.setFirstResult(0);
        query.setMaxResults(limit);
        List results = query.list();
        if(results.size() >0){
            return (List<Post>)results;
        }
        return null;
    }
    @Override
    public List<Post> getTopicPagingView(int limit) {
        // Tạo query
        Query query = sessionFactory.getCurrentSession().createQuery("from Post p ORDER BY p.view DESC");
        query.setFirstResult(0);
        query.setMaxResults(limit);
        List results = query.list();
        if(results.size() >0){
            return (List<Post>)results;
        }
        return null;
    }

    @Override
    public List<Post> searchTopic(String keyword) {
        // Tạo truy vấn
        Criteria criteria = sessionFactory.getCurrentSession().
                createCriteria(Post.class).add(Restrictions.disjunction()
                .add(Restrictions.like("name","%"+keyword+"%"))
                .add(Restrictions.like("description","%"+keyword+"%")));
        // Điều kiện 1



        List results = criteria.list();
        if(results.size() >0){
            return (List<Post>)results;
        }
        return null;
    }
}
