package hainguyen.dao.implResponsitory;

import hainguyen.dao.entity.Post;
import hainguyen.dao.responsitory.PostCrud;
import org.springframework.stereotype.Repository;

/**
 * Created by jinz on 12/12/16.
 */
@Repository("PostCrud")
public class PostCrudImpl extends CrudImpl<Post> implements PostCrud {
}
