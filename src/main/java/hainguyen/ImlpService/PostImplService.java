package hainguyen.ImlpService;

import hainguyen.dao.entity.Post;
import hainguyen.dao.responsitory.PostCrud;
import hainguyen.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 */

@Service("PostService")
@Transactional
public class PostImplService implements PostService {
    @Autowired
    PostCrud postCrud;
    @Override
    public List<Post> getAllTopic() {
        return postCrud.getAll();
    }

    @Override
    public Post insert(Post post) {
        return postCrud.insert(post);
    }

    @Override
    public Post update(Post post) {
        return postCrud.update(post);
    }

    @Override
    public Post delete(String post, String error) {
        return postCrud.delete(post,error);
    }

    @Override
    public Post findbyID(String post) {
        return postCrud.findbyID(post);
    }
}
