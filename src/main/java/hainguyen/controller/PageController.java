package hainguyen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by jinz on 13/12/16.
 */
@Controller
@RequestMapping(value = "/admin/category")
public class PageController
{
    @RequestMapping(method = RequestMethod.GET)
    public String getPageCategory(Model model){
        return "category";
    }
}
