package hainguyen.controller;

import hainguyen.dao.entity.Category;
import hainguyen.dao.entity.Post;
import hainguyen.service.CategoryService;
import hainguyen.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 */
@Controller
@RequestMapping("/")
public class PostController {

    @Autowired
    PostService postService;
    @Autowired
    CategoryService categoryService;

    // Lấy tất cả bài viết ra trang chủ
    @RequestMapping(method = RequestMethod.GET)
    public String getAllPostIndex(Model model) {
        // Not padding
        List<Post> posts = postService.getAllTopic();
        model.addAttribute("posts", posts);
        return "index";
    }

    // Quản lý bài viết
    @RequestMapping(value="/admin/edit", method = RequestMethod.GET)
    public String getAllPost(Model model) {
        // Not padding
        List<Post> posts = postService.getAllTopic();
        model.addAttribute("posts", posts);
        return "edit";
    }

    // Xem một bài viết
    @RequestMapping(value = "/admin/post/{id}", method = RequestMethod.GET)
    public String getPost(Model model, @PathVariable("id") String id, Authentication auth) {
        // Not padding
        Post currentPost = postService.findbyID(id);
        model.addAttribute("post", currentPost);
        return "post";
    }

    // Trang để chỉnh sửa bài viết
    @RequestMapping(value = "/admin/post/edit/{id}", method = RequestMethod.GET)
    public String editPostPage(Model model, @PathVariable("id") String id, @ModelAttribute("person") Post post,
                               Authentication auth, final RedirectAttributes redirectAttributes) {
        // Not padding
        Post currentPost = postService.findbyID(id);
        if (currentPost == null) {
            return "/404";
        }
        model.addAttribute("post", currentPost);
        return "edit";
    }

    // Hàm xử lý chỉnh sửa bài viết khi request form
    @RequestMapping(value = "/admin/post/edit/{id}", method = RequestMethod.POST)
    public String editPost(Model model, @PathVariable("id") String id, @ModelAttribute("post") Post post,
                           Authentication auth, final RedirectAttributes redirectAttributes) {

        String message = "";
        String status = "fail";

        // Not padding
        Post currentPost = postService.findbyID(id);
        if (currentPost == null) {
            message = "Không tìm thấy post";

        } else {
            currentPost = post;
            currentPost.setId(id);
            if (postService.update(currentPost) != null) {
                message = "Cập nhập thành công";
                status = "success";
            } else {
                message = "Cập nhập không thành công";
                status = "fail";
            }
        }
        System.out.print(message);
        redirectAttributes.addFlashAttribute("status", status);
        redirectAttributes.addFlashAttribute("message", message);

        model.addAttribute("post", currentPost);
        return "edit";
    }

    // Trang để thêm bài viết
    @RequestMapping(value = "/admin/post/add", method = RequestMethod.GET)
    public String addPostPage(Model model, Authentication auth
                              ) {
        List<Category> categories = categoryService.getCategories();
        model.addAttribute("categories",categories);
        return "add";
    }

    // Hàm xử lý lưu bài viết
    @RequestMapping(value = "/admin/post/add", method = RequestMethod.POST)
    public String addPost(Model model, @ModelAttribute("post") Post post,
                          Authentication auth, final RedirectAttributes redirectAttributes) {
        String message = "";
        String status = "fail";
        Post newPost = post;
        if (postService.insert(newPost) != null) {
            message = "Tạo bài viết thành công";
            status = "success";
            redirectAttributes.addFlashAttribute("post", newPost);
        } else {
            message = "Tạo bài viết thất bại";
            status = "fail";
        }
        redirectAttributes.addFlashAttribute("status", status);
        redirectAttributes.addFlashAttribute("message", message);
        return "post";
    }



    // Xóa bài viết
    @RequestMapping(value = "/admin/post/delete/{id}", method = RequestMethod.POST)
    public String delete(Model model, @PathVariable("id") String id,
                         Authentication auth, final RedirectAttributes redirectAttributes) {
        String message = "";
        String status = "fail";

        Post post = postService.delete(id,message);
        if (post != null) {
            status = "success";
            message = "Xóa bài viết thành công";
        } else {
            status = "fail";
            message = "Xóa bài viết không thành công";
        }


        redirectAttributes.addFlashAttribute("status", status);
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/edit";
    }

}
