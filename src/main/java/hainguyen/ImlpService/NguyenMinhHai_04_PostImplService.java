package hainguyen.ImlpService;

import hainguyen.dao.entity.Post;
import hainguyen.dao.responsitory.NguyenMinhHai_04_PostCrud;
import hainguyen.service.NguyenMinhHai_04_PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Thực thi interface NguyenMinhHai_04_PostService
 *
 */
// Khai báo Service để sử dụng chức năng AutoWrite
@Service("PostService")
@Transactional
public class NguyenMinhHai_04_PostImplService implements NguyenMinhHai_04_PostService {
    @Autowired
    NguyenMinhHai_04_PostCrud nguyenMinhHai04PostCrud;
    @Override
    public List<Post> getAllTopic() {
        return nguyenMinhHai04PostCrud.getAll();
    }

    @Override
    public List<Post> getTopicPagingNew(int limit) {
        return nguyenMinhHai04PostCrud.getTopicPagingNew(limit);
    }

    @Override
    public List<Post> getTopicPagingView(int limit) {
        return nguyenMinhHai04PostCrud.getTopicPagingView(limit);
    }

    @Override
    public List<Post> searchTopic(String keyword) {
        return nguyenMinhHai04PostCrud.searchTopic(keyword);
    }

    @Override
    public Post insert(Post post) {
        return nguyenMinhHai04PostCrud.insert(post);
    }

    @Override
    public Post update(Post post) {
        return nguyenMinhHai04PostCrud.update(post);
    }

    @Override
    public Post delete(String post, String error) {
        return nguyenMinhHai04PostCrud.delete(post,error);
    }

    @Override
    public Post findbyID(String post) {
        return nguyenMinhHai04PostCrud.findbyID(post);
    }
}
