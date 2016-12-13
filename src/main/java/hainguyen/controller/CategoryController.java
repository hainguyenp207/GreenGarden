package hainguyen.controller;

import hainguyen.dao.entity.Category;
import hainguyen.dao.entity.Post;
import hainguyen.service.CategoryService;
import hainguyen.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

/**
 * Created by jinz on 12/12/16.
 */
@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    CategoryService categoryService;


    // Lấy tất cả bài viết ra trang chủ
    @RequestMapping(method = { RequestMethod.GET })
    public ResponseEntity<?> getCategories(Model model) {
        // Not padding
        List<Category> categories = categoryService.getCategories();

        for (Category category: categories) {
            category.setPosts(null);
        }
        if (categories.isEmpty())
            return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(categories, HttpStatus.OK);
    }

    @RequestMapping(path="/{id}",method = { RequestMethod.GET }, produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> getCategory(@PathVariable("id") String id){
        Category currentCategory = categoryService.findbyID(id);
        if(currentCategory == null)
            return new ResponseEntity<Category>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<Category>(currentCategory,HttpStatus.OK);
    }

    @RequestMapping(method = { RequestMethod.POST }, produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> add(@RequestBody Category userWifi, UriComponentsBuilder ucBuilder) {
        Category CategoryExist = categoryService.findbyID(userWifi.getId());
        // Exist
        if (CategoryExist != null) {
            return new ResponseEntity<Category>(HttpStatus.CONFLICT);
        }
        categoryService.insert(userWifi);
        // System.out.println(Category.getMacAddress());
        return new ResponseEntity<Category>(userWifi, HttpStatus.CREATED);
    }
    // Using Method PUT to Update 1 User
    @RequestMapping(path = "/{CategoryID}", method = { RequestMethod.PUT }, produces = {
            MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> update(@PathVariable("CategoryID") String CategoryID, @RequestBody Category category) {

        Category currentCategory = categoryService.findbyID(CategoryID);
        if (currentCategory == null)
            return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);

        currentCategory = category;
        currentCategory.setId(CategoryID);

        if(categoryService.update(currentCategory)!=null){
            return new ResponseEntity<Category>(currentCategory, HttpStatus.OK);
        };
        return new ResponseEntity<Category>(currentCategory, HttpStatus.NOT_MODIFIED);


    }

    @RequestMapping(path = "/{CategoryID}", method = { RequestMethod.DELETE }, produces = {
            MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Category> delete(@PathVariable("CategoryID") String CategoryID) {
        Category Category = categoryService.findbyID(CategoryID);
        if (Category == null) {
            return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
        }
        String error ="";
        categoryService.delete(CategoryID,error);
        return new ResponseEntity<Category>(HttpStatus.NO_CONTENT);
    }



}
