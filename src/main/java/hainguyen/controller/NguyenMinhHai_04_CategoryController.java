package hainguyen.controller;

import hainguyen.dao.entity.Category;
import hainguyen.service.NguyenMinhHai_04_CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 * Tạo 1 controller để nhận request từ view
 * Controller này đảm nhận việc thêm, sửa, xóa chuyên mục
 * Định dạng trả về JSON và viết theo chuẩn REST.
 * Phương thức: GET,POST,PUT,DELETE
 * Tất cả các hàm được viết trong cùng một ngày, người viết cùng với lớp đó
 */
@RestController
@RequestMapping("/category")
public class NguyenMinhHai_04_CategoryController {

    // Model xử lý nghiệp vụ: Thêm sửa xóa
    @Autowired
    NguyenMinhHai_04_CategoryService nguyenMinhHai04CategoryService;


    // Lấy tất cả trang chủ ra trang chủ
    @RequestMapping(method = { RequestMethod.GET })
    public ResponseEntity<?> getCategories(Model model) {
        // Lưu trữ danh sách chuyên mục
        List<Category> categories = nguyenMinhHai04CategoryService.getCategories();
        for (Category category: categories) {
            category.setPosts(null);
        }
        if (categories.isEmpty())
            return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(categories, HttpStatus.OK);
    }

    // Lấy thông tin của một chuyên mục theo id chuyên mục
    @RequestMapping(path="/{id}",method = { RequestMethod.GET }, produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> getCategory(@PathVariable("id") String id){
        Category currentCategory = nguyenMinhHai04CategoryService.findbyID(id);
        if(currentCategory == null)
            return new ResponseEntity<Category>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<Category>(currentCategory,HttpStatus.OK);
    }

    // Thêm một chuyên mục
    @RequestMapping(method = { RequestMethod.POST }, produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> add(@RequestBody Category category, UriComponentsBuilder ucBuilder) {
        // Lấy chuyên mục ở database
        Category CategoryExist = nguyenMinhHai04CategoryService.findbyID(category.getId());
        // Exist
        if (CategoryExist != null) {
            return new ResponseEntity<Category>(HttpStatus.CONFLICT);
        }
        nguyenMinhHai04CategoryService.insert(category);
        return new ResponseEntity<Category>(category, HttpStatus.CREATED);
    }
    // Cập nhập thông tin chuyên mục
    @RequestMapping(path = "/{CategoryID}", method = { RequestMethod.PUT }, produces = {
            MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> update(@PathVariable("CategoryID") String CategoryID, @RequestBody Category category) {
        // Lấy chuyên mục ở database
        Category currentCategory = nguyenMinhHai04CategoryService.findbyID(CategoryID);
        if (currentCategory == null)
            return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);

        currentCategory = category;
        currentCategory.setId(CategoryID);

        if(nguyenMinhHai04CategoryService.update(currentCategory)!=null){
            return new ResponseEntity<Category>(currentCategory, HttpStatus.OK);
        };
        return new ResponseEntity<Category>(currentCategory, HttpStatus.NOT_MODIFIED);


    }
    // Xóa một chuyên mục
    @RequestMapping(path = "/{CategoryID}", method = { RequestMethod.DELETE }, produces = {
            MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> delete(@PathVariable("CategoryID") String CategoryID) {
        Category Category = nguyenMinhHai04CategoryService.findbyID(CategoryID);
        if (Category == null) {
            return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
        }
        String error ="";
        nguyenMinhHai04CategoryService.delete(CategoryID,error);
        return new ResponseEntity<Category>(HttpStatus.NO_CONTENT);
    }



}
