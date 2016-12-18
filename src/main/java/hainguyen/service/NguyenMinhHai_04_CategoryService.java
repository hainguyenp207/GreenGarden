package hainguyen.service;

import hainguyen.dao.entity.Category;
import hainguyen.dao.entity.Post;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Khai báo interface cho chức năng thêm, sửa, xóa chuyên mục
 */
public interface NguyenMinhHai_04_CategoryService {
    List<Category> getCategories();
    Category insert(Category post);
    Category update(Category post);
    Category delete(String categoryID, String error);
    Category findbyID(String categoryID);
}
