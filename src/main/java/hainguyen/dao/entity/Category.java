package hainguyen.dao.entity;

import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

import javax.persistence.*;
import java.util.Set;
import java.util.UUID;

/**
 * Created by jinz on 12/12/16.
 */
@Entity
@Table(name = "category")
public class Category {


    private String id;
    private String name;
    private String description;
    private Set<Post> posts;


    private int total;

    @Transient
    public int getTotal() {
        if (posts != null)
            return posts.size();
        return 0;
    }

    public void setTotal(int total) {
        this.total = total;
    }


    private Category() {
        this.id = UUID.randomUUID().toString();
    }

    public Category(String name, String description) {
        this.name = name;
        this.description = description;
    }

    @Id
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @OneToMany(mappedBy = "category", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @LazyToOne(LazyToOneOption.NO_PROXY)
    public Set<Post> getPosts() {
        return posts;
    }

    public void setPosts(Set<Post> posts) {
        this.posts = posts;
    }
}
