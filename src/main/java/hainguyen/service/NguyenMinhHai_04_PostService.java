package hainguyen.service;

import hainguyen.dao.entity.Post;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Khai báo interface cho chức năng thêm, sửa, xóa chuyên mục
 */
public interface NguyenMinhHai_04_PostService {
    List<Post> getAllTopic();
    List<Post> getTopicPagingNew(int limit);
    List<Post> getTopicPagingView(int limit);
    List<Post> searchTopic(String keyword);
    Post insert(Post post);
    Post update(Post post);
    Post delete(String post,String error);
    Post findbyID(String post);
}
