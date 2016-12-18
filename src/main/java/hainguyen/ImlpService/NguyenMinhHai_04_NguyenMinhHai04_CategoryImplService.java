package hainguyen.ImlpService;

import hainguyen.dao.entity.Category;
import hainguyen.dao.responsitory.NguyenMinhHai_04_CrudCategory;
import hainguyen.service.NguyenMinhHai_04_CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Tất cả các hàm được viết bởi 1 người, cùng thời gian
 * Thực thi service NguyenMinhHai_04_CategoryService
 */
// Khai báo Service để sử dụng chức năng AutoWrite
@Service("CategoryService")
@Transactional
public class NguyenMinhHai_04_NguyenMinhHai04_CategoryImplService implements NguyenMinhHai_04_CategoryService {
    @Autowired
    NguyenMinhHai_04_CrudCategory categoryCrud;
    @Override
    public List<Category> getCategories() {
        return categoryCrud.getAll();
    }

    @Override
    public Category insert(Category category) {
        return categoryCrud.insert(category);
    }

    @Override
    public Category update(Category category) {
        return categoryCrud.update(category);
    }

    @Override
    public Category delete(String categoryID, String error) {
        return categoryCrud.delete(categoryID,error);
    }

    @Override
    public Category findbyID(String categoryID) {
        return categoryCrud.findbyID(categoryID);
    }
}
