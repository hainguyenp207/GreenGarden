package hainguyen.dao.implResponsitory;

import hainguyen.dao.entity.Category;
import hainguyen.dao.entity.Post;
import hainguyen.dao.responsitory.CategoryCrud;
import hainguyen.dao.responsitory.PostCrud;
import org.springframework.stereotype.Repository;

/**
 * Created by jinz on 12/12/16.
 */
@Repository("CategoryCrud")
public class CategoryCrudImpl extends CrudImpl<Category> implements CategoryCrud {
}
