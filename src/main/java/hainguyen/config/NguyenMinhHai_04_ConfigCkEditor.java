package hainguyen.config;

//import net.fckeditor.connector.Connector;
//import net.fckeditor.connector.ConnectorServlet;

import net.fckeditor.connector.ConnectorServlet;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Hải on 14/12/16.
 * Câú hình CKEditor Servlet
 * Sử dụng cho trình soạn thảo văn bản trong chức năng đăng bài viết
 * Tất cả các hàm được viết trong cùng một ngày, người viết cùng với lớp đó
 */
@Configuration
public class NguyenMinhHai_04_ConfigCkEditor {
    // Đăng ký dispatcherServlet để nhận request tới thư mục xử lý ảnh
    // Ứng với mapping trong web.xml
    @Bean
    public ServletRegistrationBean dispatcherServletRegistration() {
        ServletRegistrationBean registration = new ServletRegistrationBean(servlet());
        Map<String, String> params = new HashMap<String, String>();
        registration.addUrlMappings("/assets/ckfinder/core/connector/java/connector.java");
        registration.addInitParameter("XMLConfig", "/assets/ckfinder/config.xml");
        registration.addInitParameter("sessionCookieName", "JSESSIONID");
        registration.addInitParameter("sessionParameterName", "/assets/ckfinder/config.xml");
        registration.setOrder(1);
        registration.setInitParameters(params);
        return registration;
    }
    // Trả về Servlelet
    @Bean
    public ConnectorServlet servlet() {
        return new ConnectorServlet();
    }

}

