package hainguyen.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.orm.hibernate4.support.OpenSessionInViewFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.Filter;

/**
 * Created by Hải on 21/11/16.
 * Cấu hình toàn cục cho Spring MVC
 * Tất cả các hàm được viết trong cùng một ngày, người viết cùng với lớp đó
 *
 */

@Configuration
@EnableWebMvc
public class NguyenMinhHai_04_GlobalConfig extends WebMvcConfigurerAdapter{

    /**
     * Chuyển đổi cấu hình web.xml sang dạng Annotation
     * Thiết lập cấu hình mặc định cho Spring MVC
     * Thông tin cấu hình lấy từ Spring Boot
     */

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    /**
     * Cấu hình ViewResolver, nơi sẽ tham chiếu từ controller tới view
     * Prefix: Nơi sẽ lấy file
     * Suffix: Định dạng đuôi của file cần lấy trước khi trả về view
     * @return
     */
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/page/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    // Cấu hình Encoding, chuyển đổi mã ký tự sang UTF-8
    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public CharacterEncodingFilter characterEncodingFilter() {
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        return filter;
    }

    // Cấu hình giữ session của Hibernate trên View(Giao diện)
    @Bean
    public FilterRegistrationBean filterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(openSessionInView());
        registration.addUrlPatterns("/*");

        return registration;
    }

    @Bean
    public Filter openSessionInView() {
        return new OpenSessionInViewFilter();
    }


}