package hainguyen.controller;

import hainguyen.dao.entity.Category;
import hainguyen.dao.entity.Post;
import hainguyen.service.NguyenMinhHai_04_CategoryService;
import hainguyen.service.NguyenMinhHai_04_PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

/**
 * Created by Hải on 12/12/16.
 * Controller sử dụng để xử lý chức năng thêm, sửa, xóa bài viết
 * Tất cả các hàm được cùng một người
 */
@Controller
@RequestMapping("/")
public class NguyenMinhHai_04_PostController {

    @Autowired
    NguyenMinhHai_04_PostService nguyenMinhHai04PostService;
    @Autowired
    NguyenMinhHai_04_CategoryService nguyenMinhHai04CategoryService;
    // Nơi lưu ảnh
    private static String UPLOAD_LOCATION = "/home/jinz/Desktop/";
    @Autowired
    ServletContext servletContext;

    /**
     * Lấy tất cả bài viết ra trang chủ
     * Ngày viết: 15/12/2016
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String getAllPostIndex(Model model) {
        // Lấy danh sách bài viết
        List<Post> posts = nguyenMinhHai04PostService.getAllTopic();
        // Lấy danh sách chuyên mục
        List<Category> categories = nguyenMinhHai04CategoryService.getCategories();
        // Thêm lượt xem
        for (Post post : posts) {
            post.setView(post.getView() + 1);
            nguyenMinhHai04PostService.update(post);
        }

        model.addAttribute("posts", posts);
        model.addAttribute("categories", categories);

        return "index";
    }


    /**
     *  Tìm kiếm bài viết theo từ khóa
     *  Ngày viết: 17/12/2016
     *  Người viết: Hải
     * @param model
     * @param keyword
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public String searchPost(Model model,@RequestParam(value = "keyword", required = false) String keyword ) {
        // Tìm kiếm theo từ khóa
        List<Post> posts = nguyenMinhHai04PostService.searchTopic(keyword);
        List<Category> categories = nguyenMinhHai04CategoryService.getCategories();
        if(posts!=null)
        {
            for (Post post : posts) {
                post.setView(post.getView() + 1);
                nguyenMinhHai04PostService.update(post);
            }

        }
        else
        {
            model.addAttribute("message", "Không có bài viết tìm thấy");
        }
        model.addAttribute("posts", posts);
        model.addAttribute("categories", categories);

        return "index";
    }

    /**
     * Lấy tất cả bài viết theo chuyên mục
     * Ngày viết: 16/12/2016
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value="/post/category/{id}", method = RequestMethod.GET)
    public String getAllPostCategory(Model model,@PathVariable(value = "id",required = false) String id) {
        // Validate ID
        if(id == null)
            return "404";

        // Tìm chuyên mục ứng với ID
        Category category = nguyenMinhHai04CategoryService.findbyID(id);
        if(category!=null){
            if(category.getPosts()!=null && category.getPosts().size()>0){
                Set<Post> posts = category.getPosts();
                model.addAttribute("posts", posts);
            }else{
                model.addAttribute("message", "Không tìm thấy bài viết trong chuyên mục này");
            }
        }else{
            model.addAttribute("message", "Không tìm thấy chuyên mục này");
        }
        List<Category> categories = nguyenMinhHai04CategoryService.getCategories();
        model.addAttribute("categories", categories);
        return "index";
    }


    /**
     * Trả về trang quản lý bài viết cho user
     * Ngày viết: 13/12/2016
     * @param model
     * @return
     */
    @RequestMapping(value = "/admin/edit", method = RequestMethod.GET)
    public String getAllPost(Model model) {
        // Lấy thông tin bài viết
        List<Post> posts = nguyenMinhHai04PostService.getAllTopic();
        model.addAttribute("posts", posts);
        return "edit";
    }

    /**
     * Lấy thông tin một bài viết
     * Ngày viết: 12/12/2016
     * @param model
     * @param id
     * @param auth
     * @return
     */
    @RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
    public String getPost(Model model, @PathVariable("id") String id, Authentication auth) {
        // Lấy bài viết hiện tạiấy theo ID
        Post currentPost = nguyenMinhHai04PostService.findbyID(id);
        if (currentPost != null) {
            currentPost.setView(currentPost.getView() + 1);
            nguyenMinhHai04PostService.update(currentPost);
        }
        // Lấy danh sách bài viết mới nhất
        List<Post> newPosts = nguyenMinhHai04PostService.getTopicPagingNew(6);
        // Lấy danh sách bài viết có nhiều View Nhất
        List<Post> viewTopPosts = nguyenMinhHai04PostService.getTopicPagingView(6);

        model.addAttribute("newPosts", newPosts);
        model.addAttribute("viewTopPosts", viewTopPosts);
        model.addAttribute("post", currentPost);
        return "post1";
    }


    /**
     * Sửa thông tin bài viết
     * Ngày viết: 12/06/2016
     * Người viết: Hải
     * @param model
     * @param id
     * @param post
     * @param auth
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/admin/edit/{id}", method = RequestMethod.GET)
    public String editPostPage(Model model, @PathVariable("id") String id, @ModelAttribute("post") Post post,
                               Authentication auth, final RedirectAttributes redirectAttributes) {
        // Not padding
        Post currentPost = nguyenMinhHai04PostService.findbyID(id);
        if (currentPost == null) {
            return "/404";
        }
        List<Category> categories = nguyenMinhHai04CategoryService.getCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("post", currentPost);
        return "edit-post";
    }

    /**
     * Hàm xử lý chỉnh sửa bài viết khi request form
     * Ngày viết: 12/12/2016
     * Người viết: Hải
     * @param id
     * @param post
     * @param category_id
     * @param result
     * @param file
     * @param model
     * @return
     */

    @RequestMapping(value = "/admin/edit/{id}", method = RequestMethod.POST)
    public String editPost(@PathVariable("id") String id
            , @ModelAttribute("post") Post post, @RequestParam(value = "category_id", required = false) String category_id,
                           BindingResult result, @RequestParam(value = "file", required = false) MultipartFile file, Model model
    ) {
        // cờ dùng để kiểm tra upload hình thành công?
        boolean flag = false;
        // Biến để lưu thông tin xử lý, thành công hay thất bại?
        String message = "";
        String status = "fail";
        // Lấy bài viết hiện tại
        Post currentPost = nguyenMinhHai04PostService.findbyID(id);
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "edit-post";
        } else {
            // Lưu file ảnh
            MultipartFile multipartFile = file;
            try {
                String fileName = "";
                String path = servletContext.getRealPath("/images/");
                ;
                if (file != null && !file.isEmpty() && file.getBytes().length>0) {
                    FileCopyUtils.copy(file.getBytes(), new File(path + file.getOriginalFilename()));
                    fileName = multipartFile.getOriginalFilename();
                    path += fileName;
                    flag = true;
                }
                Category category = null;
                if (category_id != null) {
                    category = nguyenMinhHai04CategoryService.findbyID(category_id);
                }

                if (currentPost == null) {
                    message = "Không tìm thấy post";

                } else {
                    currentPost = post;
                    currentPost.setId(id);
                    currentPost.setCategory(category);
                    if(flag)
                        currentPost.setImageURL("/images/" + fileName);
                    if (nguyenMinhHai04PostService.update(currentPost) != null) {
                        message = "Cập nhập hoạt động thành công";
                        status = "success";
                    } else {
                        message = "Cập nhập  hoạt động không thành công";
                        status = "fail";
                    }
                }

            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        // Not padding


        List<Category> categories = nguyenMinhHai04CategoryService.getCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("status", status);
        model.addAttribute("message", message);
        model.addAttribute("post", currentPost);
        return "edit-post";
    }

    /**
     * Trả về trang thêm bài viết
     * Ngày viết: 12/12/2016
     * @param model
     * @param auth
     * @return
     */
    @RequestMapping(value = "/admin/post/add", method = RequestMethod.GET)
    public String addPostPage(Model model, Authentication auth
    ) {
        // Lấy danh sách bài viết
        List<Category> categories = nguyenMinhHai04CategoryService.getCategories();
        model.addAttribute("categories", categories);
        return "add";
    }

    /**
     * Hàm xử lý lưu bài viết theo phương thức POST
     * Ngày viết: 12/12/2016
     * @param post
     * @param result
     * @param category_id
     * @param file
     * @param auth
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/admin/post/add", method = RequestMethod.POST)
    public String addPost(@ModelAttribute("post") Post post, BindingResult result,
                          @RequestParam(value = "category_id", required = false) String category_id,
                          @RequestParam(value = "file", required = false) MultipartFile file, Authentication auth, Model model, final RedirectAttributes redirectAttributes) {

        // Biến để lưu thông tin xử lý, thành công hay thất bại?
        String message = "";
        String status = "fail";
        Category category = null;
        if (category_id == null) {
            category = null;
        } else
            category = nguyenMinhHai04CategoryService.findbyID(category_id);
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "edit-post";
        } else {
            System.out.println("Fetching file");
            MultipartFile multipartFile = file;
            // Now do something with file...
            String path = servletContext.getRealPath("/images/");
            try {
                String fileName = "";

                if (file != null && !file.isEmpty() && file.getBytes().length>0) {
                    FileCopyUtils.copy(file.getBytes(), new File(path + file.getOriginalFilename()));
                    fileName = multipartFile.getOriginalFilename();
                    path += fileName;
                    post.setImageURL("/images/"+fileName);
                }else{
                    post.setImageURL("/images/default.jpg");
                }
                Post newPost = post;

                post.setView(0);
                if (category != null)
                    newPost.setCategory(category);
                if (nguyenMinhHai04PostService.insert(newPost) != null) {
                    message = "Tạo bài viết thành công";
                    status = "success";
                    redirectAttributes.addFlashAttribute("post", newPost);
                } else {
                    message = "Tạo bài viết thất bại";
                    status = "fail";
                }

            } catch (IOException e) {
                message = e.getMessage();
            }


        }
        redirectAttributes.addFlashAttribute("status", status);
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/post/add";
    }

    /**
     * Hàm xử lý xóa bài viết
     * Ngày viết: 12/12/2016
     * @param model
     * @param id
     * @param auth
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/admin/post/delete/{id}", method = RequestMethod.POST)
    public String delete(Model model, @PathVariable("id") String id,
                         Authentication auth, final RedirectAttributes redirectAttributes) {
        // Biến để lưu thông tin xử lý, thành công hay thất bại?
        String message = "";
        String status = "fail";

        Post post = nguyenMinhHai04PostService.delete(id, message);
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
