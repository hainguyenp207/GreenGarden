package hainguyen.ImlpService;

import hainguyen.dao.entity.Category;
import hainguyen.dao.entity.Post;
import hainguyen.dao.responsitory.CategoryCrud;
import hainguyen.dao.responsitory.PostCrud;
import hainguyen.service.CategoryService;
import hainguyen.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 */

@Service("CategoryService")
@Transactional
public class CategoryImplService implements CategoryService {
    @Autowired
    CategoryCrud categoryCrud;
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
