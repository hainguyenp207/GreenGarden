package hainguyen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Hải on 13/12/16.
 * Controller để điều hướng khi người dùng truy cập một đường dẫn
 * Tất cả các hàm được viết trong cùng một ngày, người viết cùng với lớp đó
 *
 */
@Controller
@RequestMapping(value = "/admin/category")
public class NguyenMinhHai_04_PageController
{
    /**
     * Trả về trang chuyên mục khi người dùng sử dụng
     * phương thức get truy cập đường dẫn /admin/category
      * @param model
     * @return category
     */
    @RequestMapping(method = RequestMethod.GET)
    public String getPageCategory(Model model){
        return "category";
    }
}
