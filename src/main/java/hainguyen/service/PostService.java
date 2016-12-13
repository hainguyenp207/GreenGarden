package hainguyen.service;

import hainguyen.dao.entity.Post;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 */
public interface PostService {
    List<Post> getAllTopic();
    Post insert(Post post);
    Post update(Post post);
    Post delete(String post,String error);
    Post findbyID(String post);
}
