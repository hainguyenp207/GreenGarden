package hainguyen.dao.entity;

import org.hibernate.annotations.GenericGenerator;
import org.jboss.logging.annotations.Pos;
import org.springframework.security.access.method.P;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Lớp enity dùng để mapping tới Database thông qua Hibernate
 * Các thuộc tính ứng với các cột trong bảng
 * Created by jinz on 12/12/16.
 * Lớp mapping với bảng post
 */
@Entity
@Table(name = "post")
public class Post {

    private String id;
    private String name;
    private String description;
    private String imageURL;
    private String create_by;
    private Date create_date;
    private Category category;
    private int view;



    public Post(){
        this.id = UUID.randomUUID().toString();
        this.create_date = new Date();
    };

    public Post(String name, String description, String imageURL) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.description = description;
        this.imageURL = imageURL;
        // Auto generate date create
        this.create_date = new Date();
    }
    @Id
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_category")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(columnDefinition="LONGTEXT")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Column(name = "image_url")
    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getCreate_by() {
        return create_by;
    }

    public void setCreate_by(String create_by) {
        this.create_by = create_by;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }
}
