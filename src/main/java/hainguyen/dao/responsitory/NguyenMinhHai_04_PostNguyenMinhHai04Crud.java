package hainguyen.dao.responsitory;

import hainguyen.dao.entity.Post;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Interface xử lý nghiệp vụ Thêm, Sửa, Xóa cho bài viết
 * Kế thừa từ NguyenMinhHai_04_CrudBehavior<T>
 */
public interface NguyenMinhHai_04_PostNguyenMinhHai04Crud extends NguyenMinhHai_04_CrudBehavior<Post> {

    // Bổ sung thêm phương thức  tìm bài viết,
    // Lấy bài viết mới, bài viết nổi bật
    List<Post> getTopicPagingNew(int limit);
    List<Post> getTopicPagingView(int limit);
    List<Post> searchTopic(String keyword);
}
